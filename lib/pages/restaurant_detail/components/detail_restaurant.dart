import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/notifier/food_notifier.dart';
import 'package:food_delivery/pages/restaurant_detail/components/testimonials_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles/text_styles.dart';
import '../../../models/chat_model.dart';
import '../../../models/testimonial_model.dart';
import '../../../repositories/get_restaurant.dart';
import '../../../notifier/restaurant_notifier.dart';
import '../../../widgets/buttons/button_filter_text.dart';
import '../../../widgets/cards/chat_card.dart';
import '../../../widgets/cards/food_card.dart';
import '../../../widgets/cards/restaurant_card.dart';
import '../../../widgets/title_group.dart';
import '../../chat_detail/chat_detail_screen.dart';
import '../../explore_food/explore_food_screen.dart';
import '../../food_detail/food_detail_screen.dart';
import '../restaurant_detail_screen.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key, required this.restaurantModel}) : super(key: key);
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
        (Provider.of<FoodNotifier>(context, listen: false));
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Expanded(
          child: Container(
            height: SizeConfig.screenHeight! * 0.7,
            width: SizeConfig.screenWidth! * 1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          ButtonText(
                            textFilter: 'Popular',
                          ),
                        ],
                      ),
                      Text(
                        restaurantModel.restaurantName,
                        style: textNameProfile,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        restaurantModel.restaurantDescription,
                        style: textDescriptionRestaurant,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
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
                    padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05,
                        0, SizeConfig.screenWidth! * 0.05, 0),
                    child: const TitleGroup(
                      mainTitle: 'Popular Menu',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: SizeConfig.screenWidth! * 0.3,
                  width: SizeConfig.screenWidth! * 1,
                  child: Expanded(
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
                                onTap: ()
                                {
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
                                    onPress: () {}),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExploreFoodScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05,
                        0, SizeConfig.screenWidth! * 0.05, 0),
                    child: const TitleGroup(
                      mainTitle: 'Testimonials',
                    ),
                  ),
                ),
               const SizedBox(height: 10,),
                SizedBox(
                  height: SizeConfig.screenWidth! * 0.3,
                  width: SizeConfig.screenWidth! * 1,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    removeBottom: true,
                    context: context,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: chatDemo.length,
                        itemBuilder: (context, index) => TestimonialCard(
                            chatModel: chatDemo[index],
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChatDetailScreen()));
                            }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
