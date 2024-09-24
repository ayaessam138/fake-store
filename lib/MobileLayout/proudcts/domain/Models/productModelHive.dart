import 'package:hive/hive.dart';

part 'productModelHive.g.dart';
@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final num price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;



  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,

      required this.image});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title:json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
         );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;

    return data;
  }
}
