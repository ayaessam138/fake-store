import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uitraning/MobileLayout/Home/domain/repos/HomeRepo.dart';

import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  void nextItem() {
    double itemExtent = 100;
    double offset = controller.offset + itemExtent;

    controller.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void nextItem2() {
    double itemExtent = 100;
    double offset = controller2.offset + itemExtent;

    controller2.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  final HomeRepo repo;
  var result;
  List<String> categoriesList = [];
  Future<void> getAllCategories() async {
    print('Fetching getAllCategories...');
    emit(GetAllCategoriesLoading());
    result = await repo.getAllCategories();
    result.fold((l) => emit(GetAllCategoriesFail()), (r) {
      categoriesList = r;
      emit(GetAllCategoriesSucess(categoriesList: r));
    });
  }

  List<ProductModel> productsInCategoreyList = [];
  Future<void> getProductsInCategory({required String category}) async {
    print('getProductsInCategory...');
    emit(GetProductsCategoryLoading());
    result = await repo.getProductsInCategory(Category: category);
    result.fold((l) => emit(GetProductsCategoryFail()), (r) {
      productsInCategoreyList = r;
      emit(GetProductsCategorySucess(productsList: r));
    });
  }

  List<ProductModel> productsList = [];
  Future<void> getLimitedProducts({required int number}) async {
    print('Fetching getLimitedProducts...');
    emit(GetLimitedProductsLoading());
    result = await repo.getLimitedProducts(number: number);
    result.fold((l) => emit(GetLimitedProductsFail()), (r) {
      productsList = r;
      emit(GetLimitedProductsSucess(productsList: r));
    });
  }
}
