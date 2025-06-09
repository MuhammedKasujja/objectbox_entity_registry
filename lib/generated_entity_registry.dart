import 'package:objectbox/objectbox.dart';

typedef BoxFactory = Box Function(Store store);
typedef PutFunction = int Function(Store store, dynamic object);
typedef DeleteFunction = bool Function(Store store, int id);
typedef UpdateFunction = int Function(Store store, dynamic object);

class EntityHandler {
  final BoxFactory boxFactory;
  final PutFunction putFunction;
  final DeleteFunction deleteFunction;
  final UpdateFunction updateFunction;

  const EntityHandler({
    required this.boxFactory,
    required this.putFunction,
    required this.deleteFunction,
    required this.updateFunction,
  });
}

abstract class EntityRegistry {
  final Store store;
  EntityRegistry(this.store);

  EntityHandler? get(String name);

  Box<T> box<T>() => store.box<T>();

  int save(String name, dynamic object) =>
      get(name)?.putFunction(store, object) ?? (throw Exception("Handler not found for $name"));

  bool delete(String name, int id) =>
      get(name)?.deleteFunction(store, id) ?? (throw Exception("Handler not found for $name"));

  int update(String name, dynamic object) =>
      get(name)?.updateFunction(store, object) ?? (throw Exception("Handler not found for $name"));
}
