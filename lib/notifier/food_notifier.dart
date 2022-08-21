import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/models/food_model.dart';

class FoodNotifier with ChangeNotifier {
  List<FoodModel> _foodList = [];
  List<FoodModel> _categoryFoodList = [];
  List<FoodModel> _favoriteFoodList = [];
  List<FoodModel> _cartFoodList = [];
  FoodModel? _currentFood;
  UnmodifiableListView<FoodModel> get foodList =>
      UnmodifiableListView(_foodList);
  UnmodifiableListView<FoodModel> get categoryFoodList =>
      UnmodifiableListView(_categoryFoodList);
  UnmodifiableListView<FoodModel> get favoriteFoodList =>
      UnmodifiableListView(_favoriteFoodList);
  UnmodifiableListView<FoodModel> get cartFoodList =>
      UnmodifiableListView(_cartFoodList);
  FoodModel get currentFood => _currentFood!;

  set categoryFoodList(List<FoodModel> foodList) {
    _categoryFoodList = foodList;
    notifyListeners();
  }

  set foodList(List<FoodModel> foodList) {
    _foodList = foodList;
    notifyListeners();
  }
  set favoriteFoodList(List<FoodModel> foodList) {
    _favoriteFoodList = foodList;
    notifyListeners();
  }
  set currentFood(FoodModel food) {
    _currentFood = food;
    notifyListeners();
  }
  set cartFoodList(List<FoodModel> foodList) {
    _cartFoodList = foodList;
    notifyListeners();
  }
}