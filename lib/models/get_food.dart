import 'package:cloud_firestore/cloud_firestore.dart';

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