import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart/components/body_cart.dart';
import 'package:food_delivery/pages/payments/components/body_payments.dart';
import 'package:food_delivery/widgets/size_config.dart';

class PaymentScreen extends StatelessWidget {
  static String routeName = '/PaymentScreen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyPayments(),
    );
  }
}