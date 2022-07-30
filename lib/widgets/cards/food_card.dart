import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/size_config.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.foodModel,
    required this.onPress,
    required this.restaurantModel,
  }) : super(key: key);
  final FoodModel foodModel;
  final Function onPress;
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05, 15,
            SizeConfig.screenWidth! * 0.05, 20),
        child: Container(
            height: SizeConfig.screenWidth! * 0.2,
            width: SizeConfig.screenWidth! * 0.4,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: appBackgroundButtonColor.withOpacity(0.1),
                boxShadow: const [
                  BoxShadow(color: Colors.white, blurRadius: 15)
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    ],
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '\$${foodModel.price}',
                            textAlign: TextAlign.right,
                            style: textPriceFood,
                          ))),
                ],
              ),
            )),
      ),
    );
  }
}
