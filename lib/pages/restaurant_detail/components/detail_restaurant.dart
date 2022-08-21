import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles/text_styles.dart';
import '../../../models/get_restaurant.dart';
import '../../../notifier/restaurant_notifier.dart';
import '../../../widgets/buttons/button_filter_text.dart';
import '../../../widgets/cards/restaurant_card.dart';
import '../../../widgets/title_group.dart';
import '../../explore_food/explore_food_screen.dart';
import '../restaurant_detail_screen.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    getRestaurants(restaurantNotifier);

    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
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
                      const Text(
                        'Wijie Bar and Resto',
                        style: textNameProfile,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                        style: textDescriptionRestaurant,
                      ),
                      const SizedBox(
                        height: 20,
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
                SizedBox(
                  height: SizeConfig.screenWidth! * 0.4,
                  width: SizeConfig.screenWidth! * 1,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              RestaurantDetailScreen.routeName,
                              (route) => false);
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
