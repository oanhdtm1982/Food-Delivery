import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/food_detail/components/detail_food.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyFoodDetail extends StatelessWidget {
  static String routeName = '/BodyFoodDetail';
  const BodyFoodDetail(
      {Key? key, required this.restaurantModel, required this.foodModel})
      : super(key: key);
  final RestaurantModel restaurantModel;
  final FoodModel foodModel;
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
                child: FancyShimmerImage(
                  imageUrl: foodModel.foodUrlImage,
                  boxFit: BoxFit.cover,
                ),
              ),
              DetailFood(
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
