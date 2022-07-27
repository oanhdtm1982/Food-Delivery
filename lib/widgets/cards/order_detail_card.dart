import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/buttons/add_button.dart';
import 'package:food_delivery/widgets/buttons/sub_button.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({
    Key? key,
    required this.foodModel,
    required this.onPress,
    required this.restaurantModel,
    required this.deleteOrder,
  }) : super(key: key);
  final FoodModel foodModel;
  final Function onPress;
  final Function deleteOrder;
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05, 0,
            SizeConfig.screenWidth! * 0.05, 20),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(motion: const BehindMotion(), children: [
            SlidableAction(
              onPressed: deleteOrder(),
              backgroundColor: appButtonDeleteOrder,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
          ]),
          child: Container(
              height: 100,
              width: SizeConfig.screenWidth! * 1,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: appBackgroundButtonColor.withOpacity(0.1),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, blurRadius: 15)
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Image.asset(foodModel.foodUrlImage),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodModel.foodName,
                            style: titleFood,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                              foodModel.idRestaurant ==
                                      restaurantModel.idRestaurant
                                  ? restaurantModel.restaurantName
                                  : 'null',
                              style: descRestaurantName),
                          const SizedBox(
                            height: 8,
                          ),
                          GradientText(
                            '\$ ${foodModel.price}',
                            style: textPriceFoodOrder,
                            gradient: const LinearGradient(colors: [
                              appPrimaryColor,
                              appSecondaryColor,
                            ]),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: const [
                            SubButton(),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(24, 24, 24, 0.7)),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            AddButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
