import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  String idRestaurant;
  String restaurantName;
  String restaurantTime;
  String restaurantUrlImage;
  String restaurantDescription;
  String restaurantUrlImage2;
  RestaurantModel({
    required this.idRestaurant,
    required this.restaurantName,
    required this.restaurantTime,
    required this.restaurantUrlImage,
    required this.restaurantDescription,
    required this.restaurantUrlImage2,
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
      restaurantUrlImage: doc.data().toString().contains('restaurantUrlImage')
          ? doc.get('restaurantUrlImage')
          : '',
      restaurantDescription:
          doc.data().toString().contains('restaurantDescription')
              ? doc.get('restaurantDescription')
              : '',
      restaurantUrlImage2: doc.data().toString().contains('restaurantUrlImage2')
          ? doc.get('restaurantUrlImage2')
          : '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idRestaurant': idRestaurant,
      'restaurantName': restaurantName,
      'restaurantTime': restaurantTime,
      'restaurantUrlImage': restaurantUrlImage,
      'restaurantDescription': restaurantDescription,
      'restaurantUrlImage2': restaurantUrlImage2,
    };
  }
}
