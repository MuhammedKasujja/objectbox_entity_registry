// GENERATED CODE - DO NOT MODIFY BY HAND
// 
// generated from object_registry package
// 
import 'package:objectbox_registry/generated_entity_registry.dart';
import 'package:example/models/product.dart';
import 'package:example/models/user.dart';
import 'package:example/models/task.dart';

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
  'TaskEntity': EntityHandler(
    boxFactory: (store) => store.box<TaskEntity>(),
    putFunction: (store, obj) => store.box<TaskEntity>().put(obj as TaskEntity),
    deleteFunction: (store, id) => store.box<TaskEntity>().remove(id),
    updateFunction: (store, obj) {
      final e = obj as TaskEntity;
      if (e.id == 0) throw Exception('Cannot update TaskEntity without ID');
      return store.box<TaskEntity>().put(e);
    },
  ),
};

final class GeneratedEntityRegistry extends EntityRegistry {
  GeneratedEntityRegistry(super.store);

  @override
  EntityHandler? get(String name) => _generatedRegistry[name];

  @override
  List<String>  getAllEntities() => _generatedRegistry.keys.toList();
}
