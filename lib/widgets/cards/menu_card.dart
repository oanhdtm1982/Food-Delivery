import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/size_config.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key, required this.foodModel, required this.onPress})
      : super(key: key);
  final FoodModel foodModel;
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
            Image.network(foodModel.foodUrlImage),
            const SizedBox(
              height: 12,
            ),
            Text(
              foodModel.foodName,
              style:
                  const TextStyle(fontFamily: 'BentonSans Bold', fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${foodModel.price}',
              style:
                  const TextStyle(fontFamily: 'BentonSans Book', fontSize: 13),
            ),
          ],
        ));
  }
}
