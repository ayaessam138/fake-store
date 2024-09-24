import 'package:uitraning/Core/api/dio_helper.dart';
import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/local/cartLocalDataSource.dart';
import 'package:uitraning/MobileLayout/cart/data/models/cartModel.dart';

abstract class CartRemoteDataSource {
  Future <List<CartModel>> getCart();
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  List<CartModel>CartList=[];
  @override
  Future<List<CartModel>> getCart()async {
    await DioHelper.getData(url: 'carts').then((response) {

      print(response.data);
      print(response.statusCode);

      CartList =
          List.of(response.data['data']).map((e) => CartModel.fromJson(e)).toList();
      print('remotegetCart$CartList');

      saveCartList( cartList: CartList, boxname: cartBox);
    }).catchError((onError) {
      print('remotefail');
      print(onError.toString());
      throw onError;
    });
    return CartList;
  }

}