import 'package:flutter/material.dart';

class SectionHeaderModel {
  final String title;
  final String subtitle;
  final IconData iconData;
  final String buttonTitle;
  final Color? contanierColor;

  SectionHeaderModel({
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.buttonTitle,
    this.contanierColor,
  });
}
