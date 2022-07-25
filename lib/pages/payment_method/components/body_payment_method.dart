import 'package:flutter/material.dart';
import 'package:food_delivery/pages/upload_photo/upload_photo_screen.dart';
import 'package:food_delivery/widgets/button_card.dart';
import 'package:food_delivery/widgets/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/button_custom.dart';
import '../payment_method_screen.dart';

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
                onPress: () {},
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
