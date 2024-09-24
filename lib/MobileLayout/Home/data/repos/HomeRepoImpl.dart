import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uitraning/Core/failure.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/local/categoreylocalDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/local/productsIncategoreyDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/remote/categoreyremoteDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/remote/getLimitedProductsRemoteDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/remote/productsinCategoreyRemoteDataSource.dart';
import 'package:uitraning/MobileLayout/Home/domain/repos/HomeRepo.dart';

import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

class HomeRepoImpl extends HomeRepo {
  final CategoriesLocalDataSource categoriesLocalDataSource;
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  final ProductsInCategoryRemoteDataSource productsInCategoryRemoteDataSource;
  final ProductsInCategoryLocalDataSource productsInCategoryLocalDataSource;
  final LimitedProductsRemoteDataSource limitedProductsRemoteDataSource;
  HomeRepoImpl({
    required this.productsInCategoryRemoteDataSource,
    required this.productsInCategoryLocalDataSource,
    required this.categoriesLocalDataSource,
    required this.categoriesRemoteDataSource,
    required this.limitedProductsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    try {
      var cachedDataSource = categoriesLocalDataSource.getAllCategories();
      if (cachedDataSource.isNotEmpty) {
        return right(cachedDataSource);
      }
      var remoteDataSource =
          await categoriesRemoteDataSource.getAllCategories();
      print('implgetAllCategories$remoteDataSource$cachedDataSource');
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
  Future<Either<Failure, List<ProductModel>>> getProductsInCategory(
      {required String Category}) async {
    try {
      // var cachedDataSource =
      //      productsInCategoryLocalDataSource.getAProductsInCategory();
      // if (cachedDataSource.isNotEmpty) {
      //   return right(cachedDataSource);
      // }
      var remoteDataSource = await productsInCategoryRemoteDataSource
          .getProductsInCategory(Categorey: Category);
       print('implproductsInCategoryRemoteDataSource$remoteDataSource');
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
  Future<Either<Failure, List<ProductModel>>> getLimitedProducts(
      {required int number}) async {
    try {
      var remoteDataSource = await limitedProductsRemoteDataSource
          .getLimitedProducts(number: number);
      print('implgetLimitedProducts$remoteDataSource');
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
