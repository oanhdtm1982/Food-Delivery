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
  ];
