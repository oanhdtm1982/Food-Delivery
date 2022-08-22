import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_delivery/models/food_database.dart';

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

getfavoriteFoods(FoodNotifier foodNotifier) async {
  var uid = FirebaseAuth.instance.currentUser;
  final snapshot = await FirebaseDatabase.instance.ref(uid?.uid).child('Favorite').get();
  List<FoodDataBase> favfoodList = [];
  final map = snapshot.value as Map<dynamic, dynamic>;

  map.forEach((key, value) {
    final fav = FoodDataBase.fromMap(value);

    favfoodList.add(fav);
  });
  foodNotifier.favoriteFoodList = favfoodList;
}

getCartFoods(FoodNotifier foodNotifier) async {
  var uid = FirebaseAuth.instance.currentUser;
  List<FoodDataBase> cartfoodList = [];

  final snapshot =
      await FirebaseDatabase.instance.ref(uid?.uid).child('Cart').get();

  final map = snapshot.value as Map<dynamic, dynamic>;

  map.forEach((key, value) {
    final cart = FoodDataBase.fromMap(value);

    cartfoodList.add(cart);
  });
  foodNotifier.cartFoodList = cartfoodList;
}
