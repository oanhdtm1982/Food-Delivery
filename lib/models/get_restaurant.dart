import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/restaurant_model.dart';

import '../notifier/restaurant_notifier.dart';

getRestaurants(RestaurantNotifier restaurantNotifier) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('restaurants').get();

  List<RestaurantModel> restaurantList = [];

  for (var doc in querySnapshot.docs) {
    RestaurantModel restaurantModel = RestaurantModel.fromDocument(doc);

    restaurantList.add(restaurantModel);
  }
  restaurantNotifier.restaurantList = restaurantList;
}
