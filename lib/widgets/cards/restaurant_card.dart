import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/size_config.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {Key? key, required this.restaurantModel, required this.onPress})
      : super(key: key);
  final RestaurantModel restaurantModel;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenWidth! * 0.45,
        width: SizeConfig.screenWidth! * 0.4,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: appBackgroundButtonColor.withOpacity(0.1),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 15)]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FancyShimmerImage(imageUrl: restaurantModel.restaurantUrlImage,
                height: SizeConfig.screenWidth! * 0.25,
                width: SizeConfig.screenWidth! * 0.25,
                boxFit: BoxFit.contain),
            const SizedBox(
              height: 12,
            ),
            Text(
              restaurantModel.restaurantName,
              style:
                  const TextStyle(fontFamily: 'BentonSans Bold', fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              restaurantModel.restaurantTime,
              style:
                  const TextStyle(fontFamily: 'BentonSans Book', fontSize: 13),
            ),
          ],
        ));
  }
}
