import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';

class TopScreenSign extends StatelessWidget {
  const TopScreenSign({Key? key, required this.titleSign}) : super(key: key);
  final String titleSign;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/Pattern.png'),
            Image.asset('assets/images/Gradient.png'),
            Center(
                child: Column(
              children: [
                Image.asset('assets/images/Logo.png'),
                const GradientText(
                  'FoodNinja',
                  style: TextStyle(
                    fontFamily: 'Viga',
                    letterSpacing: 4,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(colors: [
                    appPrimaryColor,
                    appSecondaryColor,
                  ]),
                ),
                const Text(
                  'Deliver Favorite Food',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 13, letterSpacing: 1),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                Text(titleSign,
                    style: const TextStyle(
                        fontFamily: 'BentonSans Bold', fontSize: 20))
              ],
            )),
          ],
        ),
      ],
    );
  }
}
