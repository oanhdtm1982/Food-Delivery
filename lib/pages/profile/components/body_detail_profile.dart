import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/widgets/cards/discount_card.dart';
import 'package:food_delivery/widgets/cards/favorite_card.dart';

import '../../../models/food_model.dart';
import '../../../models/restaurant_model.dart';
import '../../../widgets/buttons/button_filter_text.dart';

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

  Future<void> getName() async {
    await FirebaseFirestore.instance.collection("user").doc(uid?.uid).snapshots().listen((event) {
      setState(() {
        first_name = event.get("first_name");
        last_name = event.get("last_name");
        mobile_phone = event.get("mobile_phone");

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getName();
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
                  '${first_name} ${last_name}',
                  style: textNameProfile,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${mobile_phone}',
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
                          backgroundColor:  const Color.fromRGBO(83, 232, 139, 1),
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
        DiscountCard(),
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
