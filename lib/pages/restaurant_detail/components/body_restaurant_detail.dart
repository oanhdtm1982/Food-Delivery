import 'package:flutter/material.dart';
import 'package:food_delivery/pages/restaurant_detail/components/detail_restaurant.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyRestaurantDetail extends StatelessWidget {
  static String routeName = '/BodyRestaurantDetail';
  const BodyRestaurantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.35,
            width: SizeConfig.screenWidth! * 1,
            child: Image.asset('assets/images/RestaurantDetail.png',
                fit: BoxFit.cover),
          ),
          const DetailRestaurant(),
        ],
      )),
    );
  }
}
