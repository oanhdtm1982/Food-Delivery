import 'package:flutter/material.dart';
import 'package:food_delivery/pages/sign_up/sign_up_screen/components/body_sign_up.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodySignUp(),
    );
  }
}