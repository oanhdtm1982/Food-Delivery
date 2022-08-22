class TestimonialModel {
  String idUser;
  String time;
  String idFood;
  String comment;
  int star;

  TestimonialModel({
    this.idUser = '',
    this.idFood = '',
    this.time = '',
    this.comment = '',
    this.star = 1,
  });
}

List testimonialDemo= [
  TestimonialModel(
      idUser: '1', idFood: '2', comment: 'This Is great, So delicious! You Must Here, With Your family . . ', time: '20:00', star: 5),
  TestimonialModel(
      idUser: '2', idFood: '2', comment: 'Anamwp', time: '20:00', star: 4),
  TestimonialModel(
      idUser: '3', idFood: '2', comment: 'Anamwp', time: '20:00', star: 3),
];
