import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class Product {
  @Id()
  int id;
  String title;
  double price;

  Product({this.id = 0, required this.title, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}