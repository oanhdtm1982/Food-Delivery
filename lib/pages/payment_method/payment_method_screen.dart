import 'package:flutter/material.dart';
import 'package:food_delivery/pages/payment_method/components/body_payment_method.dart';
import 'package:food_delivery/widgets/size_config.dart';

class PaymentMethodScreen extends StatelessWidget {
  static String routeName = '/PaymentMethodScreen';
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyPaymentMethod(),
    );
  }
}