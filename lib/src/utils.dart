import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

Iterable<TopLevelVariableElement> topLevelNumVariables(LibraryReader reader) =>
    reader.allElements.whereType<TopLevelVariableElement>().where(
      (element) =>
          element.type.isDartCoreNum ||
          element.type.isDartCoreInt ||
          element.type.isDartCoreDouble,
    );