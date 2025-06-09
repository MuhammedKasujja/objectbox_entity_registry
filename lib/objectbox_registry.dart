import 'package:build/build.dart';
import 'src/entity_registry_builder.dart';

// Builder entityRegistryBuilder(BuilderOptions options) =>
//     SharedPartBuilder([EntityRegistryGenerator()], 'entity_registry');

// Builder entityRegistryBuilder(BuilderOptions options) =>
    // LibraryBuilder(EntityRegistryGenerator(), generatedExtension: '.registry.g.dart');
    // SharedPartBuilder([EntityRegistryGenerator()], 'entity_registry');

Builder entityRegistryBuilder(BuilderOptions options) =>
    EntityRegistryBuilder();
