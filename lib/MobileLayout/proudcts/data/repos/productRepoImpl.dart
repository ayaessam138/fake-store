import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uitraning/Core/failure.dart';

import 'package:uitraning/MobileLayout/proudcts/data/dataSource/local/productlocaldatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/remote/productsremotedatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/repos/ProudctsRepo.dart';

class ProductRepoImpelmentation extends ProductsRepo {
  final ProductsLocalDataSource productsLocalDataSource;
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpelmentation({
    required this.productsLocalDataSource,
    required this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      var cachedDataSource = await productsLocalDataSource.getAllProducts();
      if (cachedDataSource.isNotEmpty) {
        return right(cachedDataSource);
      }
      var remoteDataSource = await productRemoteDataSource.getAllProudcts();
      return right(remoteDataSource);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      } else {
        return left(Serverfailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(
      {required int id}) async {
    try {
      var remoteDataSource =
          await productRemoteDataSource.getProductById(id: id);
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
