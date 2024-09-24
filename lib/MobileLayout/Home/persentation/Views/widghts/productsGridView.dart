import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/productwidght.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({
    super.key,
    required this.trendingProductsList,
  });

  final List<ProductModel> trendingProductsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: trendingProductsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () async {
              try {
                await BlocProvider.of<ProductsCubit>(context)
                    .getProductById(id: trendingProductsList[index].id);
              } catch (e) {
                print('Error navigating to ItemDetails: $e');
                // Handle the error, e.g., show an error message to the user
              }
            },
            child: ProductItem(productModel: trendingProductsList[index]));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}