import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/explore_food/explore_food_screen.dart';
import 'package:food_delivery/pages/explore_restaurant/explore_restaurant_screen.dart';
import 'package:food_delivery/pages/home/components/banner_home.dart';
import 'package:food_delivery/widgets/cards/food_card.dart';
import 'package:food_delivery/widgets/screens/top_bar_home.dart';
import 'package:food_delivery/widgets/cards/restaurant_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/title_group.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  late final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const TopBarHome(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          BannerHome(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExploreRestaurantScreen()));
            },
            child: const TitleGroup(
              mainTitle: 'Nearest Restaurant',
            ),
          ),
          SizedBox(
            height: SizeConfig.screenWidth! * 0.6,
            width: SizeConfig.screenWidth! * 1,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => RestaurantCard(
                    restaurantModel: restaurantDemo[index], onPress: () {}),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExploreFoodScreen()));
            },
            child: const TitleGroup(mainTitle: 'Popular Menu')),
          SizedBox(
            height: SizeConfig.screenWidth! * 0.6,
            width: SizeConfig.screenWidth! * 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: foodDemo.length,
              itemBuilder: (context, index) => FoodCard(
                  restaurantModel: restaurantDemo[index],
                  foodModel: foodDemo[index],
                  onPress: () {}),
            ),
          )
        ],
      ),
    ));
  }
}
