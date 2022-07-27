import 'package:flutter/material.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/cards/food_card.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/screens/top_bar_home.dart';

class BodyExploreFood extends StatefulWidget {
  const BodyExploreFood({Key? key}) : super(key: key);

  @override
  State<BodyExploreFood> createState() => _BodyExploreFoodState();
}

class _BodyExploreFoodState extends State<BodyExploreFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarHome(),
          const Padding(
            padding: EdgeInsets.fromLTRB(31, 20, 0, 10),
            child: Text(
              'Popular Menu',
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
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: foodDemo.length,
                    itemBuilder: (context, index) => FoodCard(
                        restaurantModel: restaurantDemo[index],
                        foodModel: foodDemo[index],
                        onPress: () {}),
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
