class FoodDataBase{
  final String? idFood;
  String foodName;
  String category;
  String desc;
  String foodUrlImage;
  num price;
  String idRestaurant;
  num ratingFood;
  int quantity;
  FoodDataBase({
    this.idRestaurant = '',
    this.idFood = '',
    this.category = '',
    this.foodUrlImage = '',
    this.foodName = '',
    this.price = 0,
    this.desc = '',
    this.ratingFood = 0,
    this.quantity = 1,
  });

  factory FoodDataBase.fromMap(Map<dynamic, dynamic> map) {
    return FoodDataBase(
      idFood: map['idFood'] as String,
      foodName: map['foodName'] as String,
      category: map['category'] as String,
      desc: map['desc'] as String,
      foodUrlImage: map['foodUrlImage'] as String,
      price: map['price'] as num,
      idRestaurant: map['idRestaurant'] as String,
      ratingFood: map['ratingFood'] as num,
      quantity: map['quantity'] as int,
    );
  }

}


