import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery/pages/food_detail/food_detail_screen.dart';
import 'package:food_delivery/repositories/get_food.dart';
import 'package:food_delivery/pages/explore_food/explore_food_screen.dart';
import 'package:food_delivery/pages/explore_restaurant/explore_restaurant_screen.dart';
import 'package:food_delivery/pages/home/components/banner_home.dart';
import 'package:food_delivery/pages/restaurant_detail/restaurant_detail_screen.dart';
import 'package:food_delivery/widgets/cards/food_card.dart';
import 'package:food_delivery/widgets/screens/top_bar_home.dart';
import 'package:food_delivery/widgets/cards/restaurant_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/title_group.dart';
import 'package:provider/provider.dart';

import '../../../repositories/get_restaurant.dart';
import '../../../notifier/food_notifier.dart';
import '../../../notifier/restaurant_notifier.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  void initState() {
    super.initState();
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
        (Provider.of<FoodNotifier>(context, listen: false));
    getFoods(foodNotifier);
  }

  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05, 0,
                  SizeConfig.screenWidth! * 0.05, 0),
              child: const TitleGroup(
                mainTitle: 'Nearest Restaurant',
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenWidth! * 0.6,
            width: SizeConfig.screenWidth! * 1,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RestaurantDetailScreen(
                                    restaurantModel: restaurantNotifier
                                        .restaurantList[index],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  SizeConfig.screenWidth! * 0.05,
                                  15,
                                  SizeConfig.screenWidth! * 0.05,
                                  20),
                              child: RestaurantCard(
                                  restaurantModel:
                                      restaurantNotifier.restaurantList[index],
                                  onPress: () {}),
                            ),
                          ),
                        )),
                  );
                },
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05, 0,
                    SizeConfig.screenWidth! * 0.05, 0),
                child: const TitleGroup(mainTitle: 'Popular Menu'),
              )),
          SizedBox(
            height: SizeConfig.screenWidth! * 0.02,
          ),
          SizedBox(
            height: SizeConfig.screenWidth! * 0.6,
            width: SizeConfig.screenWidth! * 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: foodNotifier.foodList.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDetailScreen(
                                restaurantModel: restaurantNotifier.restaurantList[index],
                                foodModel: foodNotifier.foodList[index],
                              ),
                            ),
                          );
                        },
                        child: FoodCard(
                            restaurantModel:
                                restaurantNotifier.restaurantList[index],
                            foodModel: foodNotifier.foodList[index],
                            onPress: () {
                            }),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
