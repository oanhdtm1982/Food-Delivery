import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/cards/order_detail_card.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyCart extends StatelessWidget {
  static String routeName = '/BodyCart';
  const BodyCart({Key? key}) : super(key: key);

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
                title: 'Order details',
                description: '',
                onPress: () {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: foodDemo.length,
                itemBuilder: (context, index) => OrderDetailCard(
                  deleteOrder: (){},
                    restaurantModel: restaurantDemo[index],
                    foodModel: foodDemo[index],
                    onPress: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
