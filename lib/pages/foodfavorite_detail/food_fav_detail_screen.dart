import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_database.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/restaurant_detail/components/body_restaurant_detail.dart';
import 'package:food_delivery/widgets/size_config.dart';

import 'components/body_food_fav_detail.dart';

class FoodDetailFavScreen extends StatelessWidget {
  static String routeName = '/FoodDetailFavScreen ';
  const FoodDetailFavScreen ({Key? key, required this.restaurantModel, required this.foodModel}) : super(key: key);
  final RestaurantModel restaurantModel;
  final FoodDataBase foodModel;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodyFoodFavDetail(
        restaurantModel: restaurantModel,
        foodModel: foodModel,
      ),
    );
  }
}
