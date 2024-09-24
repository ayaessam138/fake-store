import 'package:hive_flutter/hive_flutter.dart';
import 'package:uitraning/Core/constans.dart';

import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

import '../../../../../main.dart';
abstract class ProductsLocalDataSource{
  List<ProductModel> getAllProducts();
  // ProductModel ?getPorduct();
}
class ProductsLocalDataSourceImpl extends ProductsLocalDataSource{
  @override
  List<ProductModel> getAllProducts() {
    try {
      final box = Hive.box<ProductModel>(productBox);
      return box.values.toList();
    } catch (e) {
      // Handle the exception here, e.g., log the error or throw a custom exception
      print('Error opening Hive box: $e');
      rethrow;
    }
  }



}

