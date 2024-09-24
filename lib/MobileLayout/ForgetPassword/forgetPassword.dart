import 'package:flutter/material.dart';

import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/Core/Layout.dart';
import 'package:uitraning/Core/widghts/Button.dart';
import 'package:uitraning/Core/widghts/TexFormField.dart';
import 'package:uitraning/MobileLayout/Login/persentation/Views/loginoptions.dart';

import '../../../../Core/widghts/title.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  static String ForgetPasswordid = 'ForgetPassword';

  TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const PageTitle(
                title: 'Forgot',
              ),
              const PageTitle(
                title: 'Password?',
              ),
              const SizedBox(
                height: 32,
              ),
              TextformFieldWidghtWithSuffixicon(
                controller: userName,
                onSaved: (String? val) {},
                HintText: 'Enter Your Email Adress',
                prefix: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        ' We will send you a message to set or reset your new passwordr',
                        style: AppStyles.styleRegular12(context)
                            .copyWith(color: AppColors.boldGrey),
                      )),
                ],
              ),
              CustomButton(
                onTap: (){
                   Navigator.pushNamed(context,AppLayout.AppLayoutid);

                },
                  backGroundcolor: AppColors.red,
                  title: 'Submit',
                  height: 60,
                  width: double.infinity,
                  titleStyle: AppStyles.styleSemiBold20(context)
                      .copyWith(color: Colors.white))
            ],
          ),
        ),
      ),
    ));
  }
}
