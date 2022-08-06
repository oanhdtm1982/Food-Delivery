import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/buttons/add_sub_button.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard(
      {Key? key,
      required this.foodModel,
      required this.restaurantModel,
      required this.onPress,
      required this.deleteOrder})
      : super(key: key);
  final FoodModel foodModel;
  final RestaurantModel restaurantModel;
  final Function() onPress;
  final Function() deleteOrder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.05, 0,
            SizeConfig.screenWidth! * 0.05, 20),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
              motion: const StretchMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {},
                closeOnCancel: true,
                confirmDismiss: () async {
                  return await _showConfirmationDialog(context, "delete") ??
                      false;
                },
              ),
              children: [
                SlidableAction(
                  flex: 1,
                  onPressed: (context) async {
                    if (await _showConfirmationDialog(context, "delete") ==
                        true) {
                      // ignore: unused_element
                      deleteOrder() {}
                    }
                  },
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
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: appBackgroundButtonColor.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.2), blurRadius: 15)
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    const Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: AddSubButton()),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

_showConfirmationDialog(BuildContext context, String action) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to $action this food?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'))
        ],
      );
    },
  );
}
