class FoodModel {
  String idFood;
  String foodName;
  String category;
  String desc;
  String foodUrlImage;
  num price;
  String idRestaurant;
  num? ratingFood;

  FoodModel({
    this.idRestaurant = '',
    this.idFood = '',
    this.category = '',
    this.foodUrlImage = '',
    this.foodName = '',
    this.price = 0,
    this.desc = '',
    this.ratingFood,
  });
}

List foodDemo = [
  FoodModel(
      idRestaurant: '1',
      idFood: '1',
      ratingFood: 4,
      foodUrlImage: 'assets/images/food1.png',
      foodName: 'Herbal Pancake',
      price: 7),
  FoodModel(
      idRestaurant: '2',
      idFood: '2',
      ratingFood: 4,
      foodUrlImage: 'assets/images/food2.png',
      foodName: 'Fruit Salad',
      price: 5),
  FoodModel(
      idRestaurant: '3',
      idFood: '3',
      ratingFood: 4,
      foodUrlImage: 'assets/images/food3.png',
      foodName: 'Green Noddle',
      price: 15),
  FoodModel(
      idRestaurant: '4',
      idFood: '4',
      ratingFood: 4,
      foodUrlImage: 'assets/images/food4.png',
      foodName: 'Spacy fresh crab',
      price: 5),
  FoodModel(
      idRestaurant: '5',
      idFood: '5',
      ratingFood: 4,
      foodUrlImage: 'assets/images/food5.png',
      foodName: 'Fruit Salad',
      price: 5),
  FoodModel(
      idRestaurant: '4',
      idFood: '6',
      ratingFood: 4,
      foodUrlImage: 'assets/images/food6.png',
      foodName: 'Fruit Salad',
      price: 10),
];
