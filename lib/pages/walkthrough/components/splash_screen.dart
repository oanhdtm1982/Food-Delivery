import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/walkthrough/components/body_walkthrough.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    delay(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/Pattern.png'),
              Image.asset('assets/images/Gradient.png'),
              Center(
                child: Image.asset('assets/images/Logo.png'),
              ),
            ],
          ), const SizedBox(height: 10,),
          const GradientText(
                'FoodNinja',
                style: TextStyle(
                  fontFamily: 'Viga',
                  letterSpacing: 4,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
                gradient: appLinearColor,
              ),
          const SizedBox(height: 10,),
          const Text('Deliver Favorite Food', 
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            letterSpacing: 1
          ),)
        ],
      ),
    );
  }

  void delay(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, BodyWalkThrough.routeName, (route) => false);
    });
  }
}
