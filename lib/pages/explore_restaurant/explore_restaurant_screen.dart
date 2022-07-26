import 'package:flutter/material.dart';
import 'package:food_delivery/pages/explore_restaurant/components/body_explore_restaurant.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ExploreRestaurantScreen extends StatelessWidget {
  static String routeName = '/ExploreRestaurantScreen';
  const ExploreRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyExploreRestaurant(),
    );
  }
}