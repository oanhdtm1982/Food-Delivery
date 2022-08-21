import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../notifier/food_notifier.dart';
import 'food_model.dart';

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
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("favFoods" + uid!.uid).get();
  List<FoodModel> favfoodList = [];

  for (var doc in querySnapshot.docs) {
    FoodModel foodModel = FoodModel.fromDocument(doc);

    favfoodList.add(foodModel);
  }

  foodNotifier.favoriteFoodList = favfoodList;
}

getCartFoods(FoodNotifier foodNotifier) async {
  var uid = FirebaseAuth.instance.currentUser;
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("cartFoods" + uid!.uid).get();
  List<FoodModel> cartfoodList = [];

  for (var doc in querySnapshot.docs) {
    FoodModel foodModel = FoodModel.fromDocument(doc);

    cartfoodList.add(foodModel);
  }

  foodNotifier.cartFoodList = cartfoodList;
}
