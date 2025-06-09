// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_registry/generated_entity_registry.dart';
import 'package:example/models/product.dart';
import 'package:example/models/user.dart';

final Map<String, EntityHandler> _generatedRegistry = {
  'Product': EntityHandler(
    boxFactory: (store) => store.box<Product>(),
    putFunction: (store, obj) => store.box<Product>().put(obj as Product),
    deleteFunction: (store, id) => store.box<Product>().remove(id),
    updateFunction: (store, obj) {
      final e = obj as Product;
      if (e.id == 0) throw Exception('Cannot update Product without ID');
      return store.box<Product>().put(e);
    },
  ),
  'User': EntityHandler(
    boxFactory: (store) => store.box<User>(),
    putFunction: (store, obj) => store.box<User>().put(obj as User),
    deleteFunction: (store, id) => store.box<User>().remove(id),
    updateFunction: (store, obj) {
      final e = obj as User;
      if (e.id == 0) throw Exception('Cannot update User without ID');
      return store.box<User>().put(e);
    },
  ),
};

class GeneratedEntityRegistry extends EntityRegistry {
  GeneratedEntityRegistry(super.store);

  @override
  EntityHandler? get(String name) => _generatedRegistry[name];
}
