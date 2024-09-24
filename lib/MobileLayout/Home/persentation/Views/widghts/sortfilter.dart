import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';

class SortFilter extends StatelessWidget {
  const SortFilter({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.styleRegular12(context),
          ),
          Image.asset(icon)
        ],
      ),
    );
  }
}