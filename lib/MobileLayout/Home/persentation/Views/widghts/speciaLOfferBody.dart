import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/transationButton.dart';

class SpecialOfferBody extends StatelessWidget {
  const SpecialOfferBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/showspecialoffer.png'),
        Positioned(
          top: 50,
          left: 200,
          child: Column(
            children: [
              Text(
                'Flat and Heels',
                style: AppStyles.styleMedium16(context),
              ),
              Text(
                'Stand a chance to get rewarded',
                style: AppStyles.styleRegular10(context),
              ),
              const SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TransationButton(
                    title: 'Visit now ',
                    textStyle: AppStyles.styleMedium12(context).copyWith(color:AppColors.white),

                    color: const Color(0xffF83758),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}