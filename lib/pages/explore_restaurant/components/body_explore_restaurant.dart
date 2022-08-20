import 'package:flutter/material.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/cards/restaurant_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/screens/top_bar_home.dart';
import 'package:provider/provider.dart';

import '../../../models/get_food.dart';
import '../../../models/get_restaurant.dart';
import '../../../notifier/food_notifier.dart';
import '../../../notifier/restaurant_notifier.dart';

class BodyExploreRestaurant extends StatefulWidget {
  const BodyExploreRestaurant({Key? key}) : super(key: key);

  @override
  State<BodyExploreRestaurant> createState() => _BodyExploreRestaurantState();
}

class _BodyExploreRestaurantState extends State<BodyExploreRestaurant> {
  @override
  void initState() {
    RestaurantNotifier restaurantNotifier =
    Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
    (Provider.of<FoodNotifier>(context, listen: false));
    getFoods(foodNotifier);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
    Provider.of<RestaurantNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarHome(),
          const Padding(
            padding: EdgeInsets.fromLTRB(31, 20, 0, 10),
            child: Text(
              'Popular Restaurant',
              style: titleGroup,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: SizeConfig.screenWidth! * 1,
              width: SizeConfig.screenWidth! * 1,
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: Expanded(
                  child: GridView.builder(
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: restaurantNotifier.restaurantList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        RestaurantCard(
                            restaurantModel: restaurantNotifier.restaurantList[index],
                            onPress: () {}),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
