import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/MobileLayout/Login/persentation/Views/Login.dart';

class ScrollPageHeader extends StatelessWidget {
  const ScrollPageHeader({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$index' + '/3',
          style: AppStyles.styleSemiBold18(context),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // Navigator.pushNamed(context,Login.Loginid);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Login();
              },
            ));
          },
          child: Text(
            'Skip',
            style: AppStyles.styleSemiBold18(context)
                .copyWith(color: Color(0xff000000)),
          ),
        )
      ],
    );
  }
}
