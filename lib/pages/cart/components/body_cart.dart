import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/pages/cart/components/total_order.dart';
import 'package:food_delivery/widgets/cards/order_detail_card.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../notifier/cart_notifier.dart';
import '../../../repositories/get_cart.dart';
import '../../../repositories/get_restaurant.dart';
import '../../../notifier/restaurant_notifier.dart';
import '../../foodfavorite_detail/food_fav_detail_screen.dart';

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
    CartNotifier cartNotifier =
        (Provider.of<CartNotifier>(context, listen: false));
    getCartFoods(cartNotifier);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
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
                  itemCount: cartNotifier.cartFoodList.length,
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
                                  builder: (context) => FoodDetailFavScreen(
                                    restaurantModel: restaurantNotifier.restaurantList[index],
                                    foodModel: cartNotifier.cartFoodList[index],
                                  ),
                                ),
                              );
                            },
                            child: OrderDetailCard(
                                deleteOrder: () {},
                                restaurantModel:
                                    restaurantNotifier.restaurantList[index],
                                foodModel: cartNotifier.cartFoodList[index],
                                onPress: () {}),
                          ),
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
