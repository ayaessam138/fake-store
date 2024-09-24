import 'package:flutter/material.dart';

class TransationButton extends StatelessWidget {
  const TransationButton({
    super.key,
    required this.title,
    required this.textStyle,
     this.borderColor,
     this.color,
  });
  final String title;
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
          Text(
            title,
            style: textStyle,
          ),
          Image.asset('assets/images/arrow.png')
        ],
      ),
    );
  }
}
