import 'package:flutter/material.dart';
import 'package:food_delivery/pages/restaurant_detail/components/body_restaurant_detail.dart';
import 'package:food_delivery/widgets/size_config.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static String routeName = '/RestaurantDetailScreen';
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyRestaurantDetail(),
    );
  }
}