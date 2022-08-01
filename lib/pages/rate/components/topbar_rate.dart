import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';

class TopBarRate extends StatelessWidget {
  const TopBarRate({Key? key, required this.foodModel}) : super(key: key);
  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('assets/images/Pattern.png'),
        Image.asset('assets/images/Gradient.png'),
        Container(
          height: 170.0,
          width: 170.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 6.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: ClipOval(
            child: Image(
              image: AssetImage(
                foodModel.foodUrlImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
