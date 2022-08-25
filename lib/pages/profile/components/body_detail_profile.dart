import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/widgets/cards/discount_card.dart';
import 'package:food_delivery/widgets/cards/favorite_card.dart';
import 'package:provider/provider.dart';

import '../../../repositories/get_favouriteFoods.dart';
import '../../../repositories/get_restaurant.dart';
import '../../../notifier/food_notifier.dart';
import '../../../notifier/restaurant_notifier.dart';
import '../../../widgets/buttons/button_filter_text.dart';
import '../../food_detail/food_detail_screen.dart';
import '../../foodfavorite_detail/food_fav_detail_screen.dart';

class BodyDetailProfile extends StatefulWidget {
  const BodyDetailProfile({Key? key, required this.userModel})
      : super(key: key);
  final UserModel userModel;

  @override
  State<BodyDetailProfile> createState() => _BodyDetailProfileState();
}

class _BodyDetailProfileState extends State<BodyDetailProfile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var uid = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  var first_name = '';
  var last_name = '';
  var mobile_phone = '';

  @override
  void initState() {
    super.initState();
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
        (Provider.of<FoodNotifier>(context, listen: false));
    getfavoriteFoods(foodNotifier);
    getName();
  }

  Future<void> getName() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(uid?.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        first_name = event.get("first_name");
        last_name = event.get("last_name");
        mobile_phone = event.get("mobile_phone");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Row(
            children: const [
              ButtonText(
                textFilter: 'Member Gold',
              ),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$first_name $last_name',
                  style: textNameProfile,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  mobile_phone,
                  style: descRestaurantName,
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      _firebaseAuth.signOut();
                      Fluttertoast.showToast(
                          msg: "SignOut Successful",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor:
                              const Color.fromRGBO(83, 232, 139, 1),
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          SignInScreen.routeName,
                          (Route<dynamic> route) => false);
                    },
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
              itemCount: foodNotifier.favoriteFoodList.length,
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
                              builder: (context) => FoodDetailFavScreen(
                                restaurantModel: restaurantNotifier.restaurantList[index],
                                foodModel: foodNotifier.favoriteFoodList[index],
                              ),
                            ),
                          );
                        },
                        child: FavoriteCard(
                            restaurantModel:
                                restaurantNotifier.restaurantList[index],
                            foodModel: foodNotifier.favoriteFoodList[index],
                            onPress: () {}),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
