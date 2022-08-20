import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  String idRestaurant;
  String restaurantName;
  String restaurantTime;
  String restaurantUrlImage;
  RestaurantModel({
    required this.idRestaurant,
    required this.restaurantName,
    required this.restaurantTime,
    required this.restaurantUrlImage,
  });


  factory RestaurantModel.fromDocument(DocumentSnapshot doc) {
    return RestaurantModel(
      idRestaurant: doc.data().toString().contains('idRestaurant')
          ? doc.get('idRestaurant')
          : '',
      restaurantName: doc.data().toString().contains('restaurantName')
          ? doc.get('restaurantName')
          : '',
      restaurantTime: doc.data().toString().contains('restaurantTime')
          ? doc.get('restaurantTime')
          : '',
      restaurantUrlImage:
      doc.data().toString().contains('restaurantUrlImage') ? doc.get('restaurantUrlImage') : '',
    );
  }

  Map<String,dynamic> toMap() {
    return {
      'idRestaurant': idRestaurant,
      'restaurantName': restaurantName,
      'restaurantTime': restaurantTime,
      'restaurantUrlImage': restaurantUrlImage,
    };
  }
}
