import 'package:hive_flutter/hive_flutter.dart';
import 'package:uitraning/Core/constans.dart';

abstract class CategoriesLocalDataSource{
  List<String> getAllCategories();
}
class CategoriesLocalDataSourceImpl extends CategoriesLocalDataSource{
  @override
  List<String> getAllCategories() {
    try {
      final box = Hive.box<String>(categoriesBox);
      print('localgetAllCategories$box');
      return box.values.toList();

    } catch (e) {
      // Handle the exception here, e.g., log the error or throw a custom exception
      print('Error opening Hive box: $e');
      rethrow;
    }
  }

}

void saveCategoriesList({
  required List<String> categoriesList,
  required String boxname,
})  {
  var box =  Hive.box<String>(boxname);
  box.addAll(categoriesList);
}