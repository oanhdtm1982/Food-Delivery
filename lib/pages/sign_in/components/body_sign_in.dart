import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/pages/forgot_password/forgot_password_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_screen/sign_up_screen.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';
import 'package:food_delivery/widgets/text_field/text_password_custom.dart';
import 'package:food_delivery/widgets/screens/top_screen_sign.dart';

class BodySignIn extends StatelessWidget {
  static String routeName = '/BodySignIn';
  const BodySignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const TopScreenSign(titleSign: 'Login to your account'),
          TextFieldCustom(
            colorBackground: appSecondaryColor,
            colorIcon: appPrimaryColor,
            onChanged: (value) {},
            hintText: 'Email',
            iconData: Icons.mail,
            errorInvalidTextField: 'Please enter valid email',
            errorNullTextField: 'Please enter your email',
            regExpTextField: RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          TextPasswordCustom(
              hintTextPassword: 'Password',
              colorBackground: appSecondaryColor,
              colorIcon: appPrimaryColor,
              onChanged: (value) {}),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          const Text(
            'Or Continue With',
            style: TextStyle(
                fontFamily: 'BentonSans Bold',
                fontSize: 12,
                color: appTextColor),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: SizeConfig.screenWidth! * 0.4,
                decoration: BoxDecoration(
                    color: appPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 40,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.03,
                    ),
                    const Text(
                      'Facebook',
                      style: TextStyle(
                          fontFamily: 'BentonSans Medium', fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.04,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: SizeConfig.screenWidth! * 0.4,
                decoration: BoxDecoration(
                    color: appPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.googlePlus,
                      color: Colors.red,
                      size: 40,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.03,
                    ),
                    const Text(
                      'Google',
                      style: TextStyle(
                          fontFamily: 'BentonSans Medium', fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.04,
          ),
          ButtonCustom(
            title: 'Login',
            onPress: () {
              Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName,
                  (Route<dynamic> route) => false);
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen()));
                  }),
                  child: const GradientText(
                    'Forgot Your Password?',
                    style: TextStyle(
                      fontFamily: 'BentonSans Medium',
                      fontSize: 12,
                    ),
                    gradient: LinearGradient(colors: [
                      appPrimaryColor,
                      appSecondaryColor,
                    ]),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      }),
                      child: const GradientText(
                        'Create an account?',
                        style: TextStyle(
                          fontFamily: 'BentonSans Medium',
                          fontSize: 12,
                        ),
                        gradient: LinearGradient(colors: [
                          appPrimaryColor,
                          appSecondaryColor,
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
