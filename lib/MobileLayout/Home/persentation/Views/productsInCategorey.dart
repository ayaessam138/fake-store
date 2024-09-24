import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/productsGridView.dart';
import 'package:uitraning/MobileLayout/Home/persentation/contrller/home_cubit.dart';

class ProductsInCategory extends StatelessWidget {
  const ProductsInCategory({super.key});

  static String productsInCategoryId = 'ProductsInCategory';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            BlocConsumer<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is GetProductsCategorySucess) {
                  return Expanded(
                      child: ProductsGridview(
                          trendingProductsList:
                              BlocProvider.of<HomeCubit>(context)
                                  .productsInCategoreyList));
                } else if (state is GetProductsCategoryFail) {
                  return const Center(child: Text('Try Later'));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              listener: (BuildContext context, HomeState state) {},
            ),
          ],
        ));
  }
}
