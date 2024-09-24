import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/Core/widghts/appbar.dart';
import 'package:uitraning/MobileLayout/Home/data/models/sectionHeaderModel.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/productsInCategorey.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/categorey.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/productwidght.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/searchbar.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/sectionHeader.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/sortfilter.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/speciaLOfferBody.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/specialOfferHeader.dart';
import 'package:uitraning/MobileLayout/Home/persentation/contrller/home_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';

import 'widghts/transationButton.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  static String Homeid = 'Home';
  final ScrollController _scrollController = ScrollController();
  List<String> categorieslist = [
    'assets/images/beauty.png',
    'assets/images/fashion.png',
    'assets/images/mens.png',
    'assets/images/kids.png',
  ];
  final SectionHeaderModel seactionHeaderModel2 = SectionHeaderModel(
      contanierColor: const Color(0xffFD6E87),
      title: 'Trending Products ',
      subtitle: 'Last Date 29/02/22 ',
      iconData: Icons.calendar_month,
      buttonTitle: 'View all');
  final SectionHeaderModel seactionHeaderModel1 = SectionHeaderModel(
      title: 'Deal of the Day',
      subtitle: '22h 55m 20s remaining ',
      iconData: Icons.alarm,
      buttonTitle: 'View all');
  //   List<ProductModel> dialyOffersList = [
  //   ProductModel(
  //       image: 'assets/images/prudct1.png',
  //       description:
  //           'Neque porro quisquam est qui dolorem ipsum quiaNeque porro quisquam est qui dolorem ipsum quiaNeque porro quisquam est qui dolorem ipsum quia',
  //       title: 'Women Printed Kurta',
  //       price: 1500, id: null,
  //    ),
  //   ProductModel(
  //       image: 'assets/images/proudct 2.png',
  //       description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //       title: 'Women Printed Kurta',
  //       price: 1500,
  //
  //
  //       ),
  //   ProductModel(
  //       image: 'assets/images/prudct1.png',
  //       description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //       title: 'Women Printed Kurta',
  //       price: 1500,
  //     ),
  //   ProductModel(
  //       image: 'assets/images/proudct 2.png',
  //       description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //       title: 'Women Printed Kurta',
  //       price: 1500,
  //       ),
  //   ProductModel(
  //       image: 'assets/images/prudct1.png',
  //       description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //       title: 'Women Printed Kurta',
  //       price: 1500,
  //       ),
  //   ProductModel(
  //       image: 'assets/images/proudct 2.png',
  //       description: 'Neque porro quisquam est qui dolorem ipsum quia',
  //       title: 'Women Printed Kurta',
  //       price: 1500,
  //   ),
  // ];
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
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    'All Featured',
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
                height: 12,
              ),

              BlocConsumer<HomeCubit, HomeState>(
                // buildWhen: (previous, current) =>
                    // current is GetAllCategoriesSucess ||
                    // current is GetAllCategoriesFail||
                    // current is GetAllCategoriesLoading ,
                builder: (context, state) {
                  // if (state is GetAllCategoriesSucess) {
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categorieslist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryWidget(
                                    image: categorieslist[index],
                                    title:
                                          BlocProvider.of<HomeCubit>(context).categoriesList[index].toString(),
                                    onTap: () {
                                      BlocProvider.of<HomeCubit>(context)
                                          .getProductsInCategory(
                                              category:
                                              BlocProvider.of<HomeCubit>(context).categoriesList[index]);
                                    },
                                  )
                                ]),
                          );
                        },
                      ),
                    );
                  // }
                  // else {
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }
                },
                listener: (BuildContext context, HomeState state) {
                  if (state is GetProductsCategorySucess) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductsInCategory();
                      },
                    ));
                    // Navigator.pushNamed(context, ProductsInCategory.productsInCategoryId);
                  }
                },
              ),
              Stack(children: [
                Image.asset('assets/images/discounts.png'),
                Positioned(
                  top: 50,
                  left: 30,
                  child: Text(
                    '50-40% OFF',
                    style: AppStyles.styleSemiBold20(context)
                        .copyWith(color: AppColors.white),
                  ),
                ),
                Positioned(
                    top: 80,
                    left: 30,
                    child: Text(
                      'Now in (product)',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: AppColors.white),
                    )),
                Positioned(
                    top: 95,
                    left: 30,
                    child: Text(
                      'All colours',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: AppColors.white),
                    )),
                Positioned(
                  top: 120,
                  left: 30,
                  child: TransationButton(
                    title: 'Shop Now',
                    textStyle: AppStyles.styleSemiBold12(context)
                        .copyWith(color: AppColors.white),
                    borderColor: AppColors.white,
                  ),
                )
              ]),
              const SizedBox(
                height: 30,
              ),
              SeactionHeader(
                seactionHeaderModel: seactionHeaderModel1,
              ),
              const SizedBox(
                height: 12,
              ),
              BlocConsumer<HomeCubit, HomeState>(
                  // buildWhen: (previous, current) =>
                  // current is GetLimitedProductsSucess ||
                  //  current is GetAllCategoriesFail ||
                  //  current is GetAllCategoriesLoading ,
                builder: (context, state) {

                  if (state is GetLimitedProductsSucess) {
                    return Stack(children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller:
                            BlocProvider.of<HomeCubit>(context).controller,
                        child: Row(
                          children: BlocProvider.of<HomeCubit>(context).productsList.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ProductItem(
                                productModel: e,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                          left: 320,
                          top: 100,
                          child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<HomeCubit>(context).nextItem();
                              },
                              child: Image.asset(
                                  'assets/images/scrollbutton.png')))
                    ]);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }, listener: (BuildContext context, HomeState state) {  },
              ),
              const SizedBox(
                height: 12,
              ),
              const SpecialOfferHeader(),
              const SizedBox(
                height: 12,
              ),
              const SpecialOfferBody(),
              const SizedBox(
                height: 12,
              ),
              SeactionHeader(seactionHeaderModel: seactionHeaderModel2),
              const SizedBox(
                height: 12,
              ),
              // BlocBuilder<HomeCubit, HomeState>(
              //   builder: (context, state) {
              //     return Stack(children: [
              //       SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         controller:
              //             BlocProvider.of<HomeCubit>(context).controller2,
              //         child: Row(
              //           children: trendingProductsList.map((e) {
              //             return Padding(
              //               padding: const EdgeInsets.only(right: 8.0),
              //               child: OfferWidght(
              //                 offerModel: e,
              //               ),
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //       Positioned(
              //           left: 320,
              //           top: 100,
              //           child: GestureDetector(
              //               onTap: () {
              //                 BlocProvider.of<HomeCubit>(context).nextItem2();
              //               },
              //               child:
              //                   Image.asset('assets/images/scrollbutton.png')))
              //     ]);
              //   },
              // ),
              const SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/hotsale.png',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Arrivals ',
                              style: AppStyles.styleMedium20(context),
                            ),
                            Text(
                              'Summer’ 25 Collections ',
                              style: AppStyles.styleRegular14(context),
                            ),
                          ],
                        ),
                        TransationButton(
                            color: const Color(0xffF83758),
                            title: 'View All',
                            textStyle: AppStyles.styleSemiBold12(context)
                                .copyWith(color: AppColors.white))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sponserd',
                      style: AppStyles.styleMedium20(context),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Image.asset('assets/images/sponsered.png'),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'up to 50% Off',
                          style: AppStyles.styleSemiBold16(context)
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

//   return
//    Scaffold(body:  Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: [
//            ElevatedButton(
//              onPressed: () {
//                _scrollToStart();
//              },
//              child: Icon(Icons.arrow_back),
//            ),
//            ElevatedButton(
//              onPressed: () {
//                _scrollToEnd();
//              },
//              child: Icon(Icons.arrow_forward),
//            ),
//          ],
//        ),
//        SizedBox(
//          height: 200, // Adjust height as needed
//          child: ListView(
//            scrollDirection: Axis.horizontal,
//            controller: _scrollController,
//            children: List.generate(
//              10,
//                  (index) => Container(
//                width: 150, // Adjust width as needed
//                margin: EdgeInsets.symmetric(horizontal: 8),
//                color: Colors.blue,
//                alignment: Alignment.center,
//                child: Text('Item $index', style: TextStyle(color: Colors.white)),
//              ),
//            ),
//          ),
//        ),
//      ],
//    ),);
// }
//
// void _scrollToStart() {
//   _scrollController.animateTo(
//     0.0,
//     duration: Duration(milliseconds: 500),
//     curve: Curves.easeInOut,
//   );
// }
//
// void _scrollToEnd() {
//   _scrollController.animateTo(
//     _scrollController.position.maxScrollExtent,
//     duration: Duration(milliseconds: 500),
//     curve: Curves.easeInOut,
//   );
// }
