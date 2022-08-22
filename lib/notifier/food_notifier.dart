import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/models/food_database.dart';
import 'package:food_delivery/models/food_model.dart';

class FoodNotifier with ChangeNotifier {
  List<FoodModel> _foodList = [];
  List<FoodModel> _categoryFoodList = [];
  List<FoodDataBase> _favoriteFoodList = [];
  List<FoodDataBase> _cartFoodList = [];
  FoodModel? _currentFood;
  UnmodifiableListView<FoodModel> get foodList =>
      UnmodifiableListView(_foodList);
  UnmodifiableListView<FoodModel> get categoryFoodList =>
      UnmodifiableListView(_categoryFoodList);
  UnmodifiableListView<FoodDataBase> get favoriteFoodList =>
      UnmodifiableListView(_favoriteFoodList);
  UnmodifiableListView<FoodDataBase> get cartFoodList =>
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

  set favoriteFoodList(List<FoodDataBase> foodList) {
    _favoriteFoodList = foodList;
    notifyListeners();
  }

  set currentFood(FoodModel food) {
    _currentFood = food;
    notifyListeners();
  }

  set cartFoodList(List<FoodDataBase> foodList) {
    _cartFoodList = foodList;
    notifyListeners();
  }
}
