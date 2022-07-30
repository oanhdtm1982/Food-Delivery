import 'package:flutter/material.dart';
import 'package:food_delivery/pages/reset_password/components/body_reset_password.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ResetPasswordScreen extends StatelessWidget {
  static String routeName = '/ResetPasswordScreen';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyResetPassword(),
    );
  }
}
