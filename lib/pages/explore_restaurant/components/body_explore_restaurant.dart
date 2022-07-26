import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/restaurant_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/top_bar_home.dart';

class BodyExploreRestaurant extends StatefulWidget {
  const BodyExploreRestaurant({Key? key}) : super(key: key);

  @override
  State<BodyExploreRestaurant> createState() => _BodyExploreRestaurantState();
}

class _BodyExploreRestaurantState extends State<BodyExploreRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarHome(),
          const Padding(
            padding: EdgeInsets.fromLTRB(31, 20, 0, 20),
            child: Text(
              'Popular Restaurant',
              style: TextStyle(
                  fontFamily: 'BentonSans Bold',
                  fontSize: 15,
                  color: appTextColor),
            ),
          ),
          SizedBox(
          height: SizeConfig.screenWidth! * 1,
          width: SizeConfig.screenWidth! * 0.5,
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: restaurantDemo.length,
              itemBuilder: (context, index) => RestaurantCard(
                  restaurantModel: restaurantDemo[index], onPress: () {}),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
