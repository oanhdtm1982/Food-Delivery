import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset('assets/images/Pattern.png'),
            Image.asset('assets/images/Gradient.png'),
            Center(
              child: Image.asset('assets/images/Illustration_success.png'),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.01,
        ),
        const GradientText(
          'Congrats!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'BentonSans Bold',
            fontSize: 30,
          ),
          gradient: LinearGradient(colors: [
            appPrimaryColor,
            appSecondaryColor,
          ]),
        ),
        Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'BentonSans Bold',
              fontSize: 23,
              color: appTextColor,
            )),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.1,
        ),
        ButtonCustom(onPress: () {}, title: text)
      ],
    );
  }
}
