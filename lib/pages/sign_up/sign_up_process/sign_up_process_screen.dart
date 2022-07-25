import 'package:flutter/material.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/components/body_sign_up_process.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SignUpProcessScreen extends StatelessWidget {
  static String routeName = '/SignUpProcessScreen';
  const SignUpProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodySignUpProcess(),
    );
  }
}