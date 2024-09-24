import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/MobileLayout/Home/data/models/dialyoffer.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/sortfilter.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/local/productlocaldatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/remote/productsremotedatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/repos/productRepoImpl.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/widghts/ItemSize.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/widghts/iteminfo.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/widghts/itemseeting.dart';

class ItemDeatils extends StatelessWidget {
  ItemDeatils({
    super.key,
  });

  static String ItemDeatilsid = 'ItemDeatils';
  List<String> Sizes = [
    '6UK',
    '7UK',
    '8UK',
    '9UK',
    '10UK',
    '11UK',
    '12UK',
  ];
  // OfferModel offerModel = OfferModel(
  //     proudctaName: 'NIke Sneakers',
  //     description: 'Vision Alta Men’s Shoes Size (All Colours)',
  //     rating: '56,890',
  //     discountPrice: '2999',
  //     price: '1500',
  //     discountPercentage: '50',
  //     deatils:
  //     'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More');

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ProductsCubit(ProductRepoImpelmentation(
            productsLocalDataSource: ProductsLocalDataSourceImpl(),
            productRemoteDataSource: ProductRemoteDataSourceImpl()))
          ..getAllProducts(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/proudctdeatilsiamge.png'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Size: 7UK',
                        style: AppStyles.styleSemiBold14(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start, //
                          children: Sizes.map((e) {
                            return ItemSize(
                              size: e,
                            );
                          }).toList(),
                        ),
                      ),
                      ItemInformation(
                        productModel: productModel,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          ItemSeeting(
                            borderColor: AppColors.boldGrey,
                            title: 'Nearest Store',
                            textStyle: AppStyles.styleMedium12(context),
                            icon: 'assets/images/nearestpalce.png',
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ItemSeeting(
                            borderColor: AppColors.boldGrey,
                            title: 'VIP',
                            textStyle: AppStyles.styleMedium12(context),
                            icon: 'assets/images/vip.png',
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ItemSeeting(
                            borderColor: AppColors.boldGrey,
                            title: 'Return policy',
                            textStyle: AppStyles.styleMedium12(context),
                            icon: 'assets/images/returnpolicy.png',
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          ItemSeeting(
                            color: const Color(0xff3F92FF),
                            title: 'Go to cart',
                            textStyle: AppStyles.styleMedium16(context)
                                .copyWith(color: AppColors.white),
                            icon: 'assets/images/gotochart.png',
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ItemSeeting(
                            color: const Color(0xff31B769),
                            title: 'Return policy',
                            textStyle: AppStyles.styleMedium16(context)
                                .copyWith(color: AppColors.white),
                            icon: 'assets/images/buynow.png',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.babyPink,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery in ',
                                      style: AppStyles.styleSemiBold14(context),
                                    ),
                                    Text(
                                      '1 within Hour ',
                                      style: AppStyles.styleSemiBold24(context),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.black),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.remove_red_eye_outlined),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'View Similar',
                                      style: AppStyles.styleMedium14(context),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.black),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Add to Compare',
                                      style: AppStyles.styleMedium14(context),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Similar To',
                        style: AppStyles.styleSemiBold20(context),
                      ),
                      Row(
                        children: [
                          Text(
                            '282+ Iteams ',
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
                              title: 'Filter',
                              icon: 'assets/images/filter.png'),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
