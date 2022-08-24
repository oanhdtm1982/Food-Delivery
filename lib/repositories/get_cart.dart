import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/food_database.dart';
import '../notifier/cart_notifier.dart';

getCartFoods(CartNotifier cartNotifier) async {
  var uid = FirebaseAuth.instance.currentUser;
  List<FoodDataBase> cartfoodList = [];

  final snapshot =
  await FirebaseDatabase.instance.ref(uid?.uid).child('Cart').get();

  final map = snapshot.value as Map<dynamic, dynamic>;

  map.forEach((key, value) {
    final cart = FoodDataBase.fromMap(value);

    cartfoodList.add(cart);
  });
  cartNotifier.cartFoodList = cartfoodList;
}