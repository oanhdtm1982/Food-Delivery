import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/buttons/button_buy_again.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../constants/styles/text_styles.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {Key? key,
      required this.foodModel,
      required this.restaurantModel,
      required this.onPress})
      : super(key: key);
  final FoodModel foodModel;
  final RestaurantModel restaurantModel;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
          height: 100,
          width: SizeConfig.screenWidth! * 1,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: appBackgroundButtonColor.withOpacity(0.1),
              boxShadow: [
                BoxShadow(color: Colors.white.withOpacity(0.2), blurRadius: 15)
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Image.asset(foodModel.foodUrlImage),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodModel.foodName,
                        style: titleFood,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          foodModel.idRestaurant == restaurantModel.idRestaurant
                              ? restaurantModel.restaurantName
                              : 'null',
                          style: descRestaurantName),
                      const SizedBox(
                        height: 8,
                      ),
                      GradientText(
                        '\$ ${foodModel.price}',
                        style: textPriceFoodOrder,
                        gradient: const LinearGradient(colors: [
                          appPrimaryColor,
                          appSecondaryColor,
                        ]),
                      ),
                    ],
                  ),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: BuyAgainButton()),
                ],
              ),
            ),
          )),
    );
  }
}
