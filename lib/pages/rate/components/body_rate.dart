import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/pages/rate/components/rating_button.dart';
import 'package:food_delivery/pages/rate/components/skip_button.dart';
import 'package:food_delivery/pages/rate/components/topbar_rate.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../models/get_food.dart';
import '../../../models/get_restaurant.dart';
import '../../../notifier/food_notifier.dart';
import '../../../notifier/restaurant_notifier.dart';

class BodyRate extends StatefulWidget {
  static String routeName = '/BodyRate';
  const BodyRate({Key? key}) : super(key: key);

  @override
  State<BodyRate> createState() => _BodyRateState();
}

class _BodyRateState extends State<BodyRate> {
  final _formKey = GlobalKey<FormState>();
  void initState() {
    RestaurantNotifier restaurantNotifier =
    Provider.of<RestaurantNotifier>(context, listen: false);
    getRestaurants(restaurantNotifier);
    FoodNotifier foodNotifier =
    (Provider.of<FoodNotifier>(context, listen: false));
    getFoods(foodNotifier);
    super.initState();
  }
  final _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    num? ratingBill;
    RestaurantNotifier restaurantNotifier =
    Provider.of<RestaurantNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          TopBarRate(
            foodModel: foodNotifier.foodList[0],
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                const Text(
                  'Thank you! Enjoy your meal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22, height: 2),
                ),
                const Text('Please rate your food',
                    style: TextStyle(height: 2)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        ratingBill = rating;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight! * 0.03,
                      bottom: SizeConfig.screenHeight! * 0.03,
                      left: 0,
                      right: 0),
                  child: Form(
                    key: _formKey,
                    child: buildFeedbackTextField(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Expanded(child: RatingButton()),
                    SizedBox(
                      width: 20,
                    ),
                    SkipButton(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildFeedbackTextField() => Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(232, 232, 232, 0.5),
            borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller: _feedbackController,
          onSaved: (value) {
            _feedbackController.text = value.toString();
          },
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            labelText: 'Feedback',
            hintText: 'How do you feel?',
            prefixIcon: Icon(
              Icons.feedback_sharp,
              color: appPrimaryColor,
            ),
            border: InputBorder.none,
          ),
        ),
      );
}
