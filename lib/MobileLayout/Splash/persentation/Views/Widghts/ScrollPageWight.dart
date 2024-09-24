import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/MobileLayout/Splash/data/models/ScrollPageModel.dart';

class ScrollPageWidght extends StatelessWidget {
  const ScrollPageWidght({super.key, required this.scrollPage});
  final ScrollPageModel scrollPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible( child: Container(height:700,child: Image.asset(scrollPage.image,))),
        const SizedBox(
          height: 12,
        ),
        Text(
          scrollPage.title,
          style: AppStyles.styleExtraBold24(context),
        ),
        const SizedBox(
          height: 12,
        ),
        FittedBox(
          child: Text(
            textAlign: TextAlign.center,
            scrollPage.subTitle,
            style: AppStyles.styleSemiBold14(context)
                .copyWith(color: const Color(0xffA8A8A9)),
          ),
        ),
      ],
    );
  }
}
