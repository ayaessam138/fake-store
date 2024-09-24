
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

import '../../../../../Core/api/dio_helper.dart';

abstract class LimitedProductsRemoteDataSource {
  Future<List<ProductModel>> getLimitedProducts({required int number});
}

class LimitedProductsRemoteDataSourceImpl
    extends LimitedProductsRemoteDataSource {
  List<ProductModel> productsList = [];
  @override
  Future<List<ProductModel>> getLimitedProducts({required int number}) async {
    await DioHelper.getData(url: 'products?limit=$number').then((response) {
      // print('ffffffffffffffffffffffffffffffffffff');
      // print(response.data);
      // print(response.statusCode);

      productsList =
          List.of(response.data).map((e) => ProductModel.fromJson(e)).toList();
      print('remotegetLimitedProducts$productsList');
      //
      // saveProductsList(
      //     productList: productsList, boxname: productsInCategoryBox);
    }).catchError((onError) {
      print('remotefail');
      print(onError.toString());
      throw onError;
    });
    return productsList;
  }
}
