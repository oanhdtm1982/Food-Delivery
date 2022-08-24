import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/restaurant_detail/components/body_restaurant_detail.dart';
import 'package:food_delivery/widgets/size_config.dart';

import 'components/body_food_detail.dart';

class FoodDetailScreen extends StatelessWidget {
  static String routeName = '/FoodDetailScreen ';
  const FoodDetailScreen ({Key? key, required this.restaurantModel, required this.foodModel}) : super(key: key);
  final RestaurantModel restaurantModel;
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyFoodDetail(
        restaurantModel: restaurantModel,
        foodModel: foodModel,
      ),
    );
  }
}
