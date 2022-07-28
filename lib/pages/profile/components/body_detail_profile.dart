import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/widgets/cards/discount_card.dart';
import 'package:food_delivery/widgets/cards/favorite_card.dart';

import '../../../models/food_model.dart';
import '../../../models/restaurant_model.dart';
import '../../../widgets/buttons/button_filter_text.dart';

class BodyDetailProfile extends StatelessWidget {
  const BodyDetailProfile({Key? key, required this.userModel})
      : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ButtonText(
          textFilter: 'Member Gold',
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.userName,
                  style: textNameProfile,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  userModel.userEmail,
                  style: descRestaurantName,
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.drive_file_rename_outline_sharp,
                      color: appSecondaryColor,
                    )),
              ),
            )
          ],
        ),
        const DiscountCard(),
        const Text(
          'Favorite',
          style: titleGroup,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: foodDemo.length,
            itemBuilder: (context, index) => FavoriteCard(
                restaurantModel: restaurantDemo[index],
                foodModel: foodDemo[index],
                onPress: () {}),
          ),
        ),
      ],
    );
  }
}
