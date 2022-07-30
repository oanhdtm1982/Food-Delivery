import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/pages/upload_photo/upload_photo_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_password_custom.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodyResetPassword extends StatelessWidget {
  static String routeName = '/BodyResetPassword';
  const BodyResetPassword({Key? key}) : super(key: key);

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
                title: 'Reset your password here',
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
              TextPasswordCustom(
                  hintTextPassword: 'New Password',
                  colorBackground: appSecondaryColor,
                  colorIcon: appPrimaryColor,
                  onChanged: (value) {}),
              const SizedBox(
                height: 20,
              ),
              TextPasswordCustom(
                  hintTextPassword: 'Confirm Password',
                  colorBackground: appSecondaryColor,
                  colorIcon: appPrimaryColor,
                  onChanged: (value) {}),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          UploadPhotoScreen.routeName,
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
