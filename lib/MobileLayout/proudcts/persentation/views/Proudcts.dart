import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/widghts/appbar.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/productsGridView.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/productwidght.dart';

import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/sortfilter.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/local/productlocaldatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/remote/productsremotedatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/repos/productRepoImpl.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/itemDeatils.dart';
import '../../../Home/persentation/Views/widghts/searchbar.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  // List<OfferModel> trendingProductsList = [
  //   OfferModel(
  //     image: 'assets/images/product3.png',
  //     description:
  //         'Neque porro quisquam est qui dolorem ipsum quiaNeque porro quisquam est qui dolorem ipsum quiaNeque porro quisquam est qui dolorem ipsum quia',
  //     proudctaName: 'Women Printed Kurta',
  //     price: '1500',
  //     discountPrice: '2499',
  //     discountPercentage: '40',
  //   ),
  //   OfferModel(
  //     image: 'assets/images/product4.png',
  //     description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //     proudctaName: 'Women Printed Kurta',
  //     price: '1500',
  //     discountPrice: '2499',
  //     discountPercentage: '40',
  //   ),
  //   OfferModel(
  //     image: 'assets/images/product3.png',
  //     description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //     proudctaName: 'Women Printed Kurta',
  //     price: '1500',
  //     discountPrice: '2499',
  //     discountPercentage: '40',
  //   ),
  //   OfferModel(
  //     image: 'assets/images/product4.png',
  //     description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //     proudctaName: 'Women Printed Kurta',
  //     price: '1500',
  //     discountPrice: '2499',
  //     discountPercentage: '40',
  //   ),
  //   OfferModel(
  //     image: 'assets/images/product3.png',
  //     description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //     proudctaName: 'Women Printed Kurta',
  //     price: '1500',
  //     discountPrice: '2499',
  //     discountPercentage: '40',
  //   ),
  //   OfferModel(
  //     image: 'assets/images/product4.png',
  //     description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //     proudctaName: 'Women Printed Kurta',
  //     price: '1500',
  //     discountPrice: '2499',
  //     discountPercentage: '40',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ProductsCubit(ProductRepoImpelmentation(
            productsLocalDataSource: ProductsLocalDataSourceImpl(),
            productRemoteDataSource: ProductRemoteDataSourceImpl()))
          ..getAllProducts(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const AppBarwidght(),
                const SizedBox(
                  height: 8,
                ),
                const Searchbar(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'A52,082+ Iteams',
                      style: AppStyles.styleSemiBold18(context),
                    ),
                    const Spacer(),
                    const SortFilter(
                      title: 'Sort',
                      icon: 'assets/images/sort.png',
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const SortFilter(
                        title: 'Filter', icon: 'assets/images/filter.png'),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                BlocConsumer<ProductsCubit, ProductsState>(
                  // buildWhen: (previous, current) =>
                  //     current is GetAllProductsLoading ||
                  //     current is GetAllProductsFail ||
                  //     current is GetAllProductsSucess,
                  builder: (context, state) {
                    if (state is GetAllProductsSucess) {
                      return Expanded(
                          child: ProductsGridview(
                              trendingProductsList: BlocProvider.of<ProductsCubit>(context).productsList));
                    } else if (state is GetAllProductsFail) {
                      return const Center(child: Text('Try Later'));
                    } else {
                      // return Expanded(
                      //     child: ProductsGridview(
                      //         trendingProductsList:));
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  listener: (BuildContext context, ProductsState state) {
                    if (state is GetAllProductByIdSucess) {
                      Navigator.pushNamed(context, ItemDeatils.ItemDeatilsid,
                          arguments: state.product);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
