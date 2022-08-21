import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: SizeConfig.screenHeight! * 0.7,
          width: SizeConfig.screenWidth! * 1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
