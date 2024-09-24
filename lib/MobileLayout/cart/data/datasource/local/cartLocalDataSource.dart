import 'package:hive_flutter/hive_flutter.dart';
import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/MobileLayout/cart/data/models/cartModel.dart';


abstract class CartsLocalDataSource {
  List<CartModel> getACart();
}

class CartsLocalDataSourceImpl
    extends CartsLocalDataSource {
  @override
  List<CartModel> getACart() {
    try {
      final box = Hive.box<CartModel>(cartBox);
      print('localgetACart$box');
      return box.values.toList();
    } catch (e) {
      // Handle the exception here, e.g., log the error or throw a custom exception
      print('Error opening Hive box: $e');
      rethrow;
    }
  }
}
void saveCartList({
  required List<CartModel> cartList,
  required String boxname,
})  {
  var box =  Hive.box<CartModel>(boxname);
  box.addAll(cartList);
}