import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/MobileLayout/Splash/data/models/ScrollPageModel.dart';

import 'package:uitraning/MobileLayout/Splash/persentation/Views/Widghts/ScrollPageHeader.dart';
import 'package:uitraning/MobileLayout/Splash/persentation/Views/Widghts/ScrollPageWight.dart';

class ScrollPage extends StatelessWidget {
  static String ScrollPageid='ScrollPage';
  ScrollPage({super.key});
  List<ScrollPageModel> Pages = [
    ScrollPageModel(
        image: 'assets/images/chooseProudct.png',
        title: 'Choose Proudct',
        subTitle:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
    ScrollPageModel(
        image: 'assets/images/makepayment.png',
        title: 'Make Payment',
        subTitle:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit'),
    ScrollPageModel(
        image: 'assets/images/getyourorder.png',
        title: 'Get Your Order',
        subTitle:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
  ];
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const ScrollPageHeader(
                  index: 1,
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  child: PageView(
                    controller: controller,
                    children: [
                      ScrollPageWidght(scrollPage: Pages[0]),
                      ScrollPageWidght(scrollPage: Pages[1]),
                      ScrollPageWidght(scrollPage: Pages[2]),
                    ],
                  ),
                )
                // Center(child: ScrollPageWidght(scrollPage: Pages[index])),
                ,
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (controller.hasClients && controller.page! > 0) {
                            controller.animateTo(
                              2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Text(
                          'Pev',
                          style: AppStyles.styleSemiBold18(context)
                              .copyWith(color: AppColors.boldGrey),
                        )),
                    SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.black,
                          dotHeight: 10,
                          dotWidth: 10),
                      controller: controller,
                      count: Pages.length,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Next',
                          style: AppStyles.styleSemiBold18(context)
                              .copyWith(color: AppColors.red),
                        )),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
// body: SafeArea(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: PageView.builder(
// controller: Controller,
// itemCount: Pages.length,
// itemBuilder: (BuildContext context, int index) {
// return SingleChildScrollView(
// child: Column(
// children: [
// ScrollPageHeader(
// index: index + 1,
// ),
// const SizedBox(height: 25),
// Center(child: ScrollPageWidght(scrollPage: Pages[index])),
// const SizedBox(height: 160),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// TextButton(
// onPressed: () {
// Controller.animateToPage(
// 2,
// duration: Duration(milliseconds: 500),
// curve: Curves.easeInOut,
// );
// },
// child: Text(
// 'Pev',
// style: AppStyles.styleSemiBold18(context)
//     .copyWith(color: AppColors.boldGrey),
// )),
// SmoothPageIndicator(
// effect: const ExpandingDotsEffect(
// activeDotColor: Colors.black,
// dotHeight: 10,
// dotWidth: 10),
// controller: Controller,
// count: Pages.length,
// ),
//
// TextButton(
// onPressed: () {},
// child: Text(
// 'Next',
// style: AppStyles.styleSemiBold18(context)
//     .copyWith(color: AppColors.red),
// )),
// ],
// )
// ],
// ),
// );
// },
// ),
// ),
// ),
