import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';

class ItemSize extends StatelessWidget {
  const ItemSize({
    super.key,
    required this.size,
  });
  final String size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                side: BorderSide(color: AppColors.red),
                borderRadius:
                BorderRadius.circular(3.0), // Set the rounded corners here
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {},
          child: Text(size,
              style: AppStyles.styleSemiBold14(context)
                  .copyWith(color: AppColors.red))),
    );
  }
}