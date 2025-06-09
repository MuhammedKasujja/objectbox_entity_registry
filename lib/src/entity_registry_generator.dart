import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:objectbox/objectbox.dart';

class EntityRegistryGenerator extends Generator {
  static final entityChecker = TypeChecker.fromRuntime(Entity);

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final buffer = StringBuffer();
    log.info('Starting generation for ${library.element.source.fullName}');

    final resolver = buildStep.resolver;
    final allLibs = await resolver.libraries.toList();

    final classes = allLibs
        .expand((lib) => lib.topLevelElements)
        .whereType<ClassElement>()
        .where((c) => entityChecker.hasAnnotationOf(c))
        .toList();

    // final classes = library.classes.where((c) {
    //   return c.metadata.any((m) {
    //     final DartObject? obj = m.computeConstantValue();
    //     if (obj == null) return false;
    //     return entityChecker.isExactlyType(obj.type!);
    //   });
    // });
    if (classes.isEmpty) return '';

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln("import 'package:objectbox/objectbox.dart';");
    buffer.writeln(
      "import 'package:objectbox_registry/generated_entity_registry.dart';",
    );

    for (final entity in classes) {
      // buffer.writeln("import '${buildStep.inputId.uri}';");
      // break; // import once from the current file
      final importUri = entity.librarySource.uri.toString();
      buffer.writeln("import '$importUri';");
    }

    buffer.writeln('\nfinal Map<String, EntityHandler> generatedRegistry = {');

    for (final clazz in classes) {
      final name = clazz.name;
      buffer.writeln("  '$name': EntityHandler(");
      buffer.writeln("    boxFactory: (store) => store.box<$name>(),");
      buffer.writeln(
        "    putFunction: (store, obj) => store.box<$name>().put(obj as $name),",
      );
      buffer.writeln(
        "    deleteFunction: (store, id) => store.box<$name>().remove(id),",
      );
      buffer.writeln("    updateFunction: (store, obj) {");
      buffer.writeln("      final e = obj as $name;");
      buffer.writeln(
        "      if (e.id == 0) throw Exception('Cannot update $name without ID');",
      );
      buffer.writeln("      return store.box<$name>().put(e);");
      buffer.writeln("    },");
      buffer.writeln("  ),");
    }

    buffer.writeln('};');

    buffer.writeln('\nclass GeneratedEntityRegistry extends EntityRegistry {');
    buffer.writeln('  GeneratedEntityRegistry(super.store);');
    buffer.writeln('  @override');
    buffer.writeln('  EntityHandler? get(String name) => generatedRegistry[name];',);
    buffer.writeln('}');

    return buffer.toString();
  }
}
