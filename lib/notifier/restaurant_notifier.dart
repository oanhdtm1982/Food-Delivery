import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/restaurant_model.dart';
import 'food_notifier.dart';

class RestaurantNotifier with ChangeNotifier {
  List<RestaurantModel> _restaurantList = [];

  List<RestaurantModel> get restaurantList => _restaurantList;

  set restaurantList(List<RestaurantModel> restaurantList) {
    _restaurantList = restaurantList;
    notifyListeners();
  }


}