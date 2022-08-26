import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/restaurant_model.dart';
import 'package:food_delivery/notifier/food_notifier.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/styles/text_styles.dart';
import '../../../models/testimonial_model.dart';
import '../../../repositories/get_restaurant.dart';
import '../../../notifier/restaurant_notifier.dart';
import '../../../widgets/buttons/button_filter_text.dart';
import '../../../widgets/title_group.dart';
import '../../chat_detail/chat_detail_screen.dart';
import '../../explore_food/explore_food_screen.dart';
import '../../restaurant_detail/components/testimonials_card.dart';

class DetailFood extends StatefulWidget {
  const DetailFood(
      {Key? key, required this.restaurantModel, required this.foodModel})
      : super(key: key);
  final RestaurantModel restaurantModel;
  final FoodModel foodModel;

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
        (Provider.of<FoodNotifier>(context, listen: false));
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Expanded(
          child: Container(
            height: SizeConfig.screenHeight! * 0.7,
            width: SizeConfig.screenWidth! * 1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
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
                          children: [
                            const ButtonText(
                              textFilter: 'Popular',
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.45,
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                var uid = FirebaseAuth.instance.currentUser;
                                DatabaseReference ref = FirebaseDatabase
                                    .instance
                                    .ref(uid!.uid)
                                    .child('Favorite')
                                    .child(widget.foodModel.foodName);
                                ref.remove().whenComplete(() {
                                  Fluttertoast.showToast(
                                      msg: 'Removed from Favorite',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          const Color.fromRGBO(83, 232, 139, 1),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  setState(() {
                                    isPressed = false;
                                  });
                                });
                              },
                              child: IconButton(
                                icon: Icon(Icons.favorite,
                                    color: (isPressed)
                                        ? const Color(0xffff0000)
                                        : const Color(0xffa29e9e)),
                                onPressed: () {
                                  var uid = FirebaseAuth.instance.currentUser;
                                  DatabaseReference ref = FirebaseDatabase
                                      .instance
                                      .ref(uid!.uid)
                                      .child('Favorite')
                                      .child(widget.foodModel.foodName);
                                  setState(() {
                                    if (isPressed == false) {
                                      isPressed = true;
                                      ref.set({
                                        'foodName': widget.foodModel.foodName,
                                        'price': widget.foodModel.price,
                                        'desc': widget.foodModel.desc,
                                        'ratingFood':
                                            widget.foodModel.ratingFood,
                                        'restaurantName': widget
                                            .restaurantModel.restaurantName,
                                        'foodUrlImage':
                                            widget.foodModel.foodUrlImage,
                                        'quantity': 1,
                                      }).whenComplete(() {
                                        Fluttertoast.showToast(
                                            msg: 'Added to Favorite',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    83, 232, 139, 1),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      });
                                    } else {
                                      isPressed = false;
                                      ref.remove().whenComplete(() {
                                        Fluttertoast.showToast(
                                            msg: 'Removed from Favorite',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    83, 232, 139, 1),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      });
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color.fromRGBO(83, 232, 139, 1),
                            ),
                            Text(
                              '${widget.foodModel.ratingFood} Rating',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.05,
                            ),
                            const Icon(
                              Icons.location_on,
                              color: Color.fromRGBO(83, 232, 139, 1),
                            ),
                            Text(
                              widget.restaurantModel.restaurantTime,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.foodModel.foodName,
                          style: textNameProfile,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '\$${widget.foodModel.price}',
                          style: const TextStyle(fontFamily: 'BentonSans Bold', fontSize: 20, color: appFoodPrice),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.foodModel.desc,
                          style: textDescriptionRestaurant,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ExploreFoodScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! * 0.01,
                                0, SizeConfig.screenWidth! * 0.01, 0),
                            child: const TitleGroup(
                              mainTitle: 'Testimonials',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenWidth! * 0.3,
                    width: SizeConfig.screenWidth! * 1,
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: testimonialDemo.length,
                          itemBuilder: (context, index) => TestimonialCard(
                              testimonialModel: testimonialDemo[index],
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const ChatDetailScreen()));
                              }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                  height: SizeConfig.screenWidth! * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      var uid = FirebaseAuth.instance.currentUser;
                      DatabaseReference ref = FirebaseDatabase.instance
                          .ref(uid!.uid)
                          .child('Cart')
                          .child(widget.foodModel.foodName);
                      ref.set({
                        'foodName': widget.foodModel.foodName,
                        'price': widget.foodModel.price,
                        'desc': widget.foodModel.desc,
                        'ratingFood': widget.foodModel.ratingFood,
                        'restaurantName':
                        widget.restaurantModel.restaurantName,
                        'foodUrlImage': widget.foodModel.foodUrlImage,
                        'quantity': 1,
                      }).whenComplete(() {
                        Fluttertoast.showToast(
                            msg: 'Add to cart success',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                            const Color.fromRGBO(83, 232, 139, 1),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: Center(
                      child: Container(
                        width: SizeConfig.screenWidth! * 0.9,
                        height: SizeConfig.screenHeight! * 0.06,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(83, 232, 139, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.screenHeight! * 0.025,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenWidth! * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
