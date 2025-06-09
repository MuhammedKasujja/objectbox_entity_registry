import 'package:objectbox/objectbox.dart';

@Entity()
class TaskEntity {
  @Id()
  int id;
  final String name;
  final String description;

  TaskEntity({this.id = 0, required this.name, required this.description});
}
