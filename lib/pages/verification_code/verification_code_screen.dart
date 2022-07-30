import 'package:flutter/material.dart';
import 'package:food_delivery/pages/verification_code/components/body_vertification_code.dart';
import 'package:food_delivery/widgets/size_config.dart';

class VertificationCodeScreen extends StatelessWidget {
  static String routeName = '/VertificationCodeScreen';
  const VertificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyVertificationCode(),
    );
  }
}