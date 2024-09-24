import 'package:hive_flutter/hive_flutter.dart';
import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

abstract class ProductsInCategoryLocalDataSource {
  List<ProductModel> getAProductsInCategory();
}

class ProductsInCategoryLocalDataSourceImpl
    extends ProductsInCategoryLocalDataSource {
  @override
  List<ProductModel> getAProductsInCategory() {
    try {
      final box = Hive.box<ProductModel>(productsInCategoryBox);
      print('localgetAProductsInCategory$box');
      return box.values.toList();
    } catch (e) {
      // Handle the exception here, e.g., log the error or throw a custom exception
      print('Error opening Hive box: $e');
      rethrow;
    }
  }
}
