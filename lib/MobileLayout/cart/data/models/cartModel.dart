import 'package:hive/hive.dart';
part 'cartModel.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final String quantity;
  @HiveField(2)
  String? image;

  CartModel({required this.productId, required this.quantity, this.image});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['id'],
      quantity: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.productId;
    data['title'] = this.quantity;

    return data;
  }
}
