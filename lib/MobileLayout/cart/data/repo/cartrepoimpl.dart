import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uitraning/Core/failure.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/local/cartLocalDataSource.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/remote/CartRemoteDataSorce.dart';
import 'package:uitraning/MobileLayout/cart/data/models/cartModel.dart';
import 'package:uitraning/MobileLayout/cart/domain/cartRepo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  final CartsLocalDataSource cartsLocalDataSource;

  CartRepoImpl({required this.cartRemoteDataSource, required this.cartsLocalDataSource});
  @override
  Future<Either<Failure, List<CartModel>>> getCart() async {
    try {
      var cachedDataSource = cartsLocalDataSource.getACart();
      if (cachedDataSource.isNotEmpty) {
        return right(cachedDataSource);
      }
      var remoteDataSource = await cartRemoteDataSource.getCart();
      print('implgetCart$remoteDataSource$cachedDataSource');
      return right(remoteDataSource);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      } else {
        return left(Serverfailure(e.toString()));
      }
    }
  }
}
