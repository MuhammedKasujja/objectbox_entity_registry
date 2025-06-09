import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'task.g.dart';

@JsonSerializable()
@Entity()
class TaskEntity {
  @Id()
  int id;
  final String name;
  final String description;

  TaskEntity({this.id = 0, required this.name, required this.description});
}
