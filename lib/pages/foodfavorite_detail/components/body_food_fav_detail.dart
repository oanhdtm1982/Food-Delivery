import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_database.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/food_detail/components/detail_food.dart';
import 'package:food_delivery/pages/foodfavorite_detail/components/detail_fav_food.dart';
import 'package:food_delivery/pages/restaurant_detail/components/detail_restaurant.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyFoodFavDetail extends StatelessWidget {
  static String routeName = '/BodyFoodDetail';
  const BodyFoodFavDetail(
      {Key? key, required this.restaurantModel, required this.foodModel})
      : super(key: key);
  final RestaurantModel restaurantModel;
  final FoodDataBase foodModel;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Scaffold(
              body: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.35,
                width: SizeConfig.screenWidth! * 1,
                child: Image.network(
                  foodModel.foodUrlImage,
                  fit: BoxFit.cover,
                ),
              ),
              DetailFoodFav(
                restaurantModel: restaurantModel,
                foodModel: foodModel,
              ),
            ],
          )),
          const BackButton(),
        ],
      ),
    );
  }
}
