import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/Core/function.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/local/categoreylocalDataSource.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

import '../../../../../Core/api/dio_helper.dart';

abstract class ProductsInCategoryRemoteDataSource {
  Future <List<ProductModel>> getProductsInCategory({required String Categorey});
}

class ProductsInCategoryRemoteDataSourceImpl extends ProductsInCategoryRemoteDataSource {
  List<ProductModel>productsList=[];
  @override
  Future<List<ProductModel>> getProductsInCategory({required String Categorey})async {
    await DioHelper.getData(url: 'products/category/$Categorey').then((response) {

      print(response.data);
      print(response.statusCode);

      productsList =
          List.of(response.data).map((e) => ProductModel.fromJson(e)).toList();
      print('remotegetProductsInCategory$productsList');

      saveProductsList( productList: productsList, boxname: productsInCategoryBox);
    }).catchError((onError) {
      print('remotefail');
      print(onError.toString());
      throw onError;
    });
    return productsList;
  }

}
