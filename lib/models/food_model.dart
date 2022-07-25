class FoodModel {
  String idFood;
  String name;
  String category;
  String desc;
  String images;
  num price;
  String idRestaurant;
  num? ratingFood;

  FoodModel({
    this.idRestaurant = '',
    this.idFood = '',
    this.category = '',
    this.images = '',
    this.name = '',
    this.price = 0,
    this.desc = '',
    this.ratingFood,
  });
}