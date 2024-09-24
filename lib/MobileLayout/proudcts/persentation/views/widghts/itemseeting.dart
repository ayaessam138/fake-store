import 'package:flutter/material.dart';

class ItemSeeting extends StatelessWidget {
  const ItemSeeting({
    super.key,
    required this.title,
    required this.textStyle,
    this.borderColor,
    this.color, required this.icon,
  });
  final String title;
  final String icon;
  final TextStyle textStyle;
  final Color? borderColor;
  final Color ? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor??Colors.transparent)),
      child: Row(
        children: [
          Image.asset(icon),
          Text(
            title,
            style: textStyle,
          ),

        ],
      ),
    );
  }
}
