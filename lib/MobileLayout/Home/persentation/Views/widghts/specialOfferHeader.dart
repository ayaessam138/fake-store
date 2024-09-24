import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';

class SpecialOfferHeader extends StatelessWidget {
  const SpecialOfferHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Image.asset('assets/images/sepicaloffer.png'),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Special Offers',
                      style: AppStyles.styleMedium16(context),
                    ),
                    Image.asset("assets/images/emoji.png")
                  ],
                ),
                Text(
                    'We make sure you get the offer you need at best prices',
                    style: AppStyles.styleMedium12(context).copyWith(
                      fontWeight: FontWeight.w300,
                    ))
              ],
            )
          ],
        ));
  }
}