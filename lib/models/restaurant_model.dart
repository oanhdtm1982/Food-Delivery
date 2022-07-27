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
}

 List restaurantDemo = [
    RestaurantModel(
      idRestaurant: '1',
      restaurantName: 'Vegan Resto',
      restaurantTime: '12 Mins',
      restaurantUrlImage: 'assets/images/RestaurantImage1.png',
    ),
    RestaurantModel(
      idRestaurant: '2',
      restaurantName: 'Healthy Food',
      restaurantTime: '8 Mins',
      restaurantUrlImage: 'assets/images/RestaurantImage2.png',
    ),
    RestaurantModel(
      idRestaurant: '3',
      restaurantName: 'Good Food',
      restaurantTime: '12 Mins',
      restaurantUrlImage: 'assets/images/RestaurantImage3.png',
    ),
    RestaurantModel(
      idRestaurant: '4',
      restaurantName: 'Smart Resto',
      restaurantTime: '8 Mins',
      restaurantUrlImage: 'assets/images/RestaurantImage4.png',
    ),
    RestaurantModel(
      idRestaurant: '5',
      restaurantName: 'Vegan Resto',
      restaurantTime: '8 Mins',
      restaurantUrlImage: 'assets/images/RestaurantImage5.png',
    ),
    RestaurantModel(
      idRestaurant: '6',
      restaurantName: 'Healthy Food',
      restaurantTime: '8 Mins',
      restaurantUrlImage: 'assets/images/RestaurantImage6.png',
    ),
  ];
