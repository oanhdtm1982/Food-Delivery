import 'package:flutter/material.dart';
import 'package:food_delivery/pages/forgot_password/components/body_forgot_password.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/ForgotPasswordScreen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyForgotPassword(),
    );
  }
}