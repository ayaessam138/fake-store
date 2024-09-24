import 'package:dartz/dartz.dart';
import 'package:uitraning/Core/failure.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<String>>> getAllCategories();
  Future<Either<Failure, List<ProductModel >>> getProductsInCategory({required String Category});
  Future<Either<Failure, List<ProductModel >>> getLimitedProducts({required int  number});

}