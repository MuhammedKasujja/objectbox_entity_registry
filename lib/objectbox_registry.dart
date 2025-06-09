library objectbox_registry;

import 'package:build/build.dart';
import 'package:objectbox_registry/src/entity_registry_generator.dart';
import 'package:source_gen/source_gen.dart';
// import 'package:objectbox_registry/src/property_product_generator.dart';
import 'src/entity_registry_builder.dart';

// Builder entityRegistryBuilder(BuilderOptions options) =>
//     SharedPartBuilder([EntityRegistryGenerator()], 'entity_registry');

// Builder productBuilder(BuilderOptions options) =>
//     SharedPartBuilder([PropertyProductGenerator()], 'product');

// Builder entityRegistryBuilder(BuilderOptions options) =>
    // LibraryBuilder(EntityRegistryGenerator(), generatedExtension: '.registry.g.dart');
    // SharedPartBuilder([EntityRegistryGenerator()], 'entity_registry');

Builder entityRegistryBuilder(BuilderOptions options) =>
    EntityRegistryBuilder();
