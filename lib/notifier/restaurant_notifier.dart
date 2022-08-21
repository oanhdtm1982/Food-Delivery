import 'package:flutter/material.dart';

import '../models/restaurant_model.dart';

class RestaurantNotifier with ChangeNotifier {
  List<RestaurantModel> _restaurantList = [];

  List<RestaurantModel> get restaurantList => _restaurantList;

  set restaurantList(List<RestaurantModel> restaurantList) {
    _restaurantList = restaurantList;
    notifyListeners();
  }
}
