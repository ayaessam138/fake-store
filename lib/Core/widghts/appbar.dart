import 'package:flutter/material.dart';

class AppBarwidght extends StatelessWidget {
  const AppBarwidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          child: Image.asset('assets/images/drwaer.png'),
        ),
        Image.asset('assets/images/logo.png'),
        CircleAvatar(
          child: Image.asset('assets/images/personalphoto.png'),
        ),
      ],
    );
  }
}