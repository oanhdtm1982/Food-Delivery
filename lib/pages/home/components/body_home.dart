import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/explore_restaurant/explore_restaurant_screen.dart';
import 'package:food_delivery/pages/home/components/banner_home.dart';
import 'package:food_delivery/widgets/top_bar_home.dart';
import 'package:food_delivery/widgets/restaurant_card.dart';
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
        body: Column(
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
            Navigator.pushNamedAndRemoveUntil(
                context,
                ExploreRestaurantScreen.routeName,
                (Route<dynamic> route) => false);
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
              //itemCount: restaurantDemo.length,
              itemCount: 2,
              itemBuilder: (context, index) => RestaurantCard(
                  restaurantModel: restaurantDemo[index], onPress: () {}),
            ),
          ),
        ),
        const TitleGroup(mainTitle: 'Popular Menu'),
      ],
    ));
  }
}
