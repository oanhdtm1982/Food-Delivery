import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/sign_up_process_screen.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';
import 'package:food_delivery/widgets/text_field/text_password_custom.dart';
import 'package:food_delivery/widgets/screens/top_screen_sign.dart';

class BodySignUp extends StatelessWidget {
  static String routeName = '/BodySignUp';
  const BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children:  [
              const TopScreenSign(titleSign: 'Sign Up For Free'),
              TextFieldCustom(
          colorBackground: appSecondaryColor,
            colorIcon: appPrimaryColor,
            onChanged: (value) {},
            hintText: 'Username',
            iconData: Icons.person,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          TextFieldCustom(
            colorBackground: appSecondaryColor,
            colorIcon: appPrimaryColor,
            onChanged: (value) {},
            hintText: 'Email',
            iconData: Icons.mail,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          TextPasswordCustom(
            colorBackground: appSecondaryColor,
            colorIcon: appPrimaryColor,
            onChanged: (value) {}),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.04,
          ),
          ButtonCustom(
            title: 'Create Account',
            onPress: (){
              Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    SignUpProcessScreen.routeName,
                                    (Route<dynamic> route) => false);
            },
          ),
          
           SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
              const GradientText(
          'Already have an account?',
                style: TextStyle(
                  fontFamily: 'BentonSans Medium',
                  fontSize: 12,
                ),
                gradient: LinearGradient(colors: [
                  appPrimaryColor,
                  appSecondaryColor,
                ]),
               ),
            ]),
        ));
  }
}