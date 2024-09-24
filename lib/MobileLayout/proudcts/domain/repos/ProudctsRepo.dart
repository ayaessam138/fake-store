import 'package:dartz/dartz.dart';
import 'package:uitraning/Core/failure.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';


abstract class ProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel >> getProductById({required int id});
}
