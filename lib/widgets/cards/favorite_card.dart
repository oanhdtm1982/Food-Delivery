import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/food_database.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/widgets/buttons/button_buy_again.dart';
import 'package:food_delivery/widgets/gradient_text.dart';

import '../../constants/styles/text_styles.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {Key? key,
      required this.foodModel,
      required this.restaurantModel,
      required this.onPress})
      : super(key: key);
  final FoodDataBase foodModel;
  final RestaurantModel restaurantModel;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: appBackgroundButtonColor.withOpacity(0.1),
                boxShadow: const [
                  BoxShadow(color: Colors.white, blurRadius: 15)
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(foodModel.foodUrlImage,
                      width: 50, height: 50, fit: BoxFit.fill),
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
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                var uid = FirebaseAuth.instance.currentUser;
                                DatabaseReference ref = FirebaseDatabase
                                    .instance
                                    .ref(uid!.uid)
                                    .child('Cart')
                                    .child(foodModel.foodName);
                                ref.set({
                                  'foodName': foodModel.foodName,
                                  'price': foodModel.price,
                                  'desc': foodModel.desc,
                                  'ratingFood': foodModel.ratingFood,
                                  'restaurantName':
                                      restaurantModel.restaurantName,
                                  'foodUrlImage': foodModel.foodUrlImage,
                                  'quantity': 1,
                                }).whenComplete(() {
                                  Fluttertoast.showToast(
                                      msg: 'Add to cart success',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          const Color.fromRGBO(83, 232, 139, 1),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                });
                              },
                              child: const BuyAgainButton()))),
                ],
              ),
            )),
      ),
    );
  }
}
