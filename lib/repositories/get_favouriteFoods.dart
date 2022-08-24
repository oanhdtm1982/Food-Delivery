import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/food_database.dart';
import '../notifier/food_notifier.dart';

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