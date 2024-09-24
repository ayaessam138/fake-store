import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/local/categoreylocalDataSource.dart';

import '../../../../../Core/api/dio_helper.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<String>> getAllCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  @override
  List<String> categoriesList = [];
  @override
  Future<List<String>> getAllCategories() async {
    await DioHelper.getData(url: 'products/categories').then((response) {

      // print(response.data);
      // print(response.statusCode);

      for( String item  in response.data){
        categoriesList.add(item);

      }
      print('remotegetAllCategories$categoriesList');

      saveCategoriesList( categoriesList: categoriesList, boxname: categoriesBox);
    }).catchError((onError) {
      print('remotefail');
      print(onError.toString());
      throw onError;
    });
    return categoriesList;
  }
}
