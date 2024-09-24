import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/MobileLayout/Home/data/models/sectionHeaderModel.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/widghts/transationButton.dart';

class SeactionHeader extends StatelessWidget {
  const SeactionHeader({
    super.key,
    required this.seactionHeaderModel,
  });
  final SectionHeaderModel seactionHeaderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: seactionHeaderModel.contanierColor ?? AppColors.blue,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  seactionHeaderModel.title,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: AppColors.white),
                ),
                Row(
                  children: [
                    Icon(
                      seactionHeaderModel.iconData,
                      color: AppColors.white,
                    ),
                    Text(
                      seactionHeaderModel.subtitle,
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: AppColors.white),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            TransationButton(
                title: seactionHeaderModel.buttonTitle,
                textStyle: AppStyles.styleSemiBold12(context)
                    .copyWith(color: AppColors.white),
                borderColor: AppColors.white),
          ],
        ),
      ),
    );
  }
}
