import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/Core/widghts/Button.dart';
import 'package:uitraning/Core/widghts/TexFormField.dart';
import 'package:uitraning/MobileLayout/ForgetPassword/forgetPassword.dart';
import 'package:uitraning/MobileLayout/Login/persentation/Views/loginoptions.dart';

import '../../../../Core/widghts/title.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  static String SignUpid = 'SignUp';

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
                  title: 'Create an',
                ),
                const PageTitle(
                  title: 'Account',
                ),
                const SizedBox(
                  height: 32,
                ),
                TextformFieldWidghtWithSuffixicon(
                  controller: userName,
                  onSaved: (String? val) {},
                  HintText: 'Username or Email',
                  prefix: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextformFieldWidghtWithSuffixicon(
                  controller: password,
                  onSaved: (String? val) {},
                  HintText: 'Password',
                  prefix: const Icon(Icons.lock),
                  suffix: const Icon(Icons.remove_red_eye_outlined),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextformFieldWidghtWithSuffixicon(
                  controller: confirmPassword,
                  onSaved: (String? val) {},
                  HintText: 'confirm Password',
                  prefix: const Icon(Icons.lock),
                  suffix: const Icon(Icons.remove_red_eye_outlined),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'By clicking the Register button, you agree to the public offer',
                          style: AppStyles.styleRegular12(context)
                              .copyWith(color: AppColors.boldGrey),
                        )),
                  ],
                ),
                CustomButton(
                  onTap: (){
                    Navigator.pushNamed(context, ForgetPassword.ForgetPasswordid);
                  },
                    backGroundcolor: AppColors.red,
                    title: 'Cerate account',
                    height: 60,
                    width: double.infinity,
                    titleStyle: AppStyles.styleSemiBold20(context)
                        .copyWith(color: Colors.white)),
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  '- OR Continue with -',
                  style: AppStyles.styleMedium12(context),
                )),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginOptions(
                      option: 'assets/images/goggleIcon.png',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    LoginOptions(
                      option: 'assets/images/ios.png',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    LoginOptions(
                      option: 'assets/images/facebook.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I Already Have an Account',
                      style: AppStyles.styleRegular14(context),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: AppStyles.styleSemiBold14(context)
                              .copyWith(color: AppColors.red),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
