import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/Core/widghts/Button.dart';
import 'package:uitraning/Core/widghts/TexFormField.dart';
import 'package:uitraning/MobileLayout/Login/persentation/Views/loginoptions.dart';
import 'package:uitraning/MobileLayout/SignUp/signUp.dart';

import '../../../../Core/widghts/title.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static String Loginid = 'Login';
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
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
                  title: 'Welcome',
                ),
                const PageTitle(
                  title: ' Back!',
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
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style: AppStyles.styleRegular12(context)
                              .copyWith(color: AppColors.red),
                        )),
                  ],
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, SignUp.SignUpid);
                    },
                    backGroundcolor: AppColors.red,
                    title: 'Login',
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
                      'Create An Account',
                      style: AppStyles.styleRegular14(context),
                    ),
                    Text(
                      'Sign Up',
                      style: AppStyles.styleSemiBold14(context)
                          .copyWith(color: AppColors.red),
                    )
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
