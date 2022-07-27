import 'package:flutter/material.dart';
import 'package:food_delivery/pages/explore_food/components/body_explore_food.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ExploreFoodScreen extends StatelessWidget {
  static String routeName = '/ExploreFoodScreen';
  const ExploreFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyExploreFood(),
    );
  }
}