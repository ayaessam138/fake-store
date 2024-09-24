part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class NextItemState extends HomeState {}
class GetAllCategoriesLoading extends HomeState {}
class GetAllCategoriesSucess extends HomeState {
final  List<String>categoriesList;

  GetAllCategoriesSucess({required this.categoriesList});
}
class GetAllCategoriesFail extends HomeState {}
class GetProductsCategoryLoading extends HomeState {}
class GetProductsCategorySucess extends HomeState {
final  List<ProductModel>productsList;

  GetProductsCategorySucess({required this.productsList});
}
class GetProductsCategoryFail extends HomeState {}
class GetLimitedProductsLoading extends HomeState {}
class GetLimitedProductsSucess extends HomeState {
final  List<ProductModel>productsList;

  GetLimitedProductsSucess({required this.productsList});
}
class GetLimitedProductsFail extends HomeState {}
