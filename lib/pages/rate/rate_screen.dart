import 'package:flutter/material.dart';
import 'package:food_delivery/pages/rate/components/body_rate.dart';
import 'package:food_delivery/widgets/size_config.dart';

class RateScreen extends StatelessWidget {
  static String routeName = '/RateScreen';
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyRate(),
    );
  }
}