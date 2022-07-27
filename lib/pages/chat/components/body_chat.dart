import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/cards/food_card.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyChat extends StatelessWidget {
  static String routeName = '/BodyChat';
  const BodyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! * 0.05,
            SizeConfig.screenHeight! * 0.05,
            SizeConfig.screenWidth! * 0.05,
            0),
              child: AppBarCustom(
                title: 'Chat',
                description: '',
                onPress: () {},
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
      ),
    );
  }
}
