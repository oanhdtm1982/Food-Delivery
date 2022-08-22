import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/pages/cart/components/total_order.dart';
import 'package:food_delivery/widgets/cards/order_detail_card.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../repositories/get_food.dart';
import '../../../repositories/get_restaurant.dart';
import '../../../notifier/food_notifier.dart';
import '../../../notifier/restaurant_notifier.dart';

class BodyCart extends StatefulWidget {
  static String routeName = '/BodyCart';
  const BodyCart({Key? key}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  void initState() {
    super.initState();
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
        (Provider.of<FoodNotifier>(context, listen: false));
    getCartFoods(foodNotifier);

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! * 0.05,
                  SizeConfig.screenHeight! * 0.05,
                  SizeConfig.screenWidth! * 0.05,
                  0),
              child: AppBarCustom(
                title: 'Order details',
                description: '',
                onPress: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      BottomBar.routeName, (Route<dynamic> route) => false);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: foodNotifier.cartFoodList.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: OrderDetailCard(
                              deleteOrder: () {},
                              restaurantModel:
                                  restaurantNotifier.restaurantList[index],
                              foodModel: foodNotifier.cartFoodList[index],
                              onPress: () {}),
                        ),
                      ),
                    );
                  }),
            ),
            const TotalOrder(),
          ],
        ),
      ),
    );
  }
}
