import 'package:flutter/material.dart';
import 'package:uitraning/Core/Appcolors.dart';

class LoginOptions extends StatelessWidget {
  LoginOptions({
    super.key, required this.option,
  });
  final String option;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:AppColors.red, // Change the border color here
            width:0.5, // Adjust the border width as needed
          )),

      child: CircleAvatar(
        backgroundColor: AppColors.babyPink,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(option),
        ),
      ),
    );
  }
}