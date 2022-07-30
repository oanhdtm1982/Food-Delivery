import 'package:flutter/material.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/components/body_sign_up_process.dart';
import 'package:food_delivery/pages/upload_photo/upload_photo_screen.dart';
import 'package:food_delivery/widgets/buttons/button_card.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodyPaymentMethod extends StatelessWidget {
  static String routeName = '/BodyPaymentMethod';
  const BodyPaymentMethod({Key? key}) : super(key: key);

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
                title: 'Payment Method',
                description:
                    'This data will be displayed in your account profile for security',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BodySignUpProcess()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
              ButtonCard(
                urlImage: 'assets/images/paypal.png',
                onPress: () {},
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
              ButtonCard(
                urlImage: 'assets/images/visa.png',
                onPress: () {},
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
              ButtonCard(
                urlImage: 'assets/images/Payoneer.png',
                onPress: () {},
              ),
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
