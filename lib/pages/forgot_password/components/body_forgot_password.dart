import 'package:flutter/material.dart';
import 'package:food_delivery/pages/forgot_password/components/forgot_password_option.dart';
import 'package:food_delivery/pages/reset_password/reset_password_screen.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodyForgotPassword extends StatelessWidget {
  static String routeName = '/BodyForgotPassword';
  const BodyForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.screenWidth! * 0.05,
              SizeConfig.screenHeight! * 0.05,
              SizeConfig.screenWidth! * 0.05,
              0),
          child: Column(
            children: [
              AppBarCustom(
                title: 'Forgot password?',
                description:
                    'Select which contact details should we use to reset your password',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
               ForgotPasswordOption(
                forgotPasswordUrlImage: 'assets/images/sms.png',
                textForgotPassword: 'Via sms',
                descForgotPassword: '.... ... ...',
                onPress: (){},
              ),
              const SizedBox(
                height: 20,
              ),
               ForgotPasswordOption(
                forgotPasswordUrlImage: 'assets/images/mail.png',
                textForgotPassword: 'Via email',
                descForgotPassword: '.... @gmail.com',
                onPress: (){},
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          ResetPasswordScreen.routeName,
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
