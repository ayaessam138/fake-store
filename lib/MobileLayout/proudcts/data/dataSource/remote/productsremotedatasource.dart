import 'package:uitraning/Core/api/dio_helper.dart';
import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/Core/function.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProudcts();
  Future<ProductModel> getProductById({required int id});
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  List<ProductModel> productsList = [];
  ProductModel? productModel;
  @override
  Future<List<ProductModel>> getAllProudcts() async {
    await DioHelper.getData(url: 'products').then((response) {
      print('getAllProudcts');
      print(response.data);
      print(response.statusCode);
      productsList =
          List.of(response.data).map((e) => ProductModel.fromJson(e)).toList();

      saveProductsList(productList: productsList, boxname: productBox);
    }).catchError((onError) {
      print(onError.toString());
      throw onError;
    });
    return productsList;
  }

  @override
  Future<ProductModel> getProductById({required int id}) async {
    await DioHelper.getData(url: 'products/$id', )
        .then((response) {
      print('getProductById');
      print(response.data);
      print(response.statusCode);
      productModel = ProductModel.fromJson(response.data);


    }).catchError((onError) {
      print(onError.toString());
      throw onError;
    });
    return productModel!;
  }
}
