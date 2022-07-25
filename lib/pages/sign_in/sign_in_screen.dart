import 'package:flutter/material.dart';
import 'package:food_delivery/pages/sign_in/components/body_sign_in.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodySignIn(),
    );
  }
}