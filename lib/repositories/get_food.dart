import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery/models/food_database.dart';
import 'package:food_delivery/notifier/cart_notifier.dart';

import '../notifier/food_notifier.dart';
import '../models/food_model.dart';

getFoods(FoodNotifier foodNotifier) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('foods').get();
  List<FoodModel> foodList = [];

  for (var doc in querySnapshot.docs) {
    FoodModel foodModel = FoodModel.fromDocument(doc);

    foodList.add(foodModel);
  }
  foodNotifier.foodList = foodList;
}




