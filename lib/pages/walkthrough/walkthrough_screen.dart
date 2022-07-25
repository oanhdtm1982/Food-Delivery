import 'package:flutter/material.dart';
import 'package:food_delivery/pages/walkthrough/components/body_walkthrough.dart';
import 'package:food_delivery/widgets/size_config.dart';

class WalkThroughScreen extends StatelessWidget {
  static String routeName = '/walkthrough';
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyWalkThrough(),
    );
  }
}
