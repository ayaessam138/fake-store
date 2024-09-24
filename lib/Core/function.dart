import 'package:hive_flutter/hive_flutter.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

void saveProductsList({
  required List<ProductModel> productList,
  required String boxname,
})  {
  var box =  Hive.box<ProductModel>(boxname); // Ensure the box is opened asynchronously
  box.addAll(productList);
}