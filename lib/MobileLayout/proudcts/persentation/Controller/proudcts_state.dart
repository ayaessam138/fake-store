part of 'proudcts_cubit.dart';

@immutable
abstract class ProductsState {}

class ProudctsInitial extends ProductsState {}
class GetAllProductsLoading extends ProductsState {}
class GetAllProductsSucess extends ProductsState {
  final List<ProductModel>products;

  GetAllProductsSucess({required this.products});
}
class GetAllProductsFail extends ProductsState {}
class GetAllProductByIdLoading extends ProductsState {}
class GetAllProductByIdSucess extends ProductsState {
  final ProductModel product;

  GetAllProductByIdSucess({required this.product});
}
class GetAllProductByIdFail extends ProductsState {}
