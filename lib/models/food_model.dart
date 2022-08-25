import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String idFood;
  String foodName;
  String category;
  String desc;
  String foodUrlImage;
  num price;
  String idRestaurant;
  num? ratingFood;
  String restaurantName;


  FoodModel({
    this.idRestaurant = '',
    this.idFood = '',
    this.category = '',
    this.foodUrlImage = '',
    this.foodName = '',
    this.price = 0,
    this.desc = '',
    this.ratingFood,
    this.restaurantName = '',
  });

  factory FoodModel.fromDocument(DocumentSnapshot doc) {
    return FoodModel(
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      idFood: doc.data().toString().contains('idFood') ? doc.get('idFood') : '',
      foodName: doc.data().toString().contains('foodName') ? doc.get('foodName') : '',
      desc: doc.data().toString().contains('desc') ? doc.get('desc') : '',
      foodUrlImage:
          doc.data().toString().contains('foodUrlImage') ? doc.get('foodUrlImage') : '',
      price: doc.data().toString().contains('price') ? doc.get('price') : 0,
      ratingFood: doc.data().toString().contains('ratingFood')
          ? doc.get('ratingFood')
          : 0,
      category:
          doc.data().toString().contains('category') ? doc.get('category') : '',
      restaurantName: doc.data().toString().contains('restaurantName') ? doc.get('restaurantName') : '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idFood': idFood,
      'foodName': foodName,
      'desc': desc,
      'foodUrlImage': foodUrlImage,
      'price': price,
      'idRestaurant': idRestaurant,
      'ratingFood': ratingFood,
      'category': category,
      'restaurantName': restaurantName,
    };
  }
}
