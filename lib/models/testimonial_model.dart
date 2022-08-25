class TestimonialModel {
  String idUser;
  String time;
  String idFood;
  String comment;
  int star;
  String image;
  String name;

  TestimonialModel({
    this.idUser = '',
    this.idFood = '',
    this.time = '',
    this.comment = '',
    this.star = 1,
    this.image = '',
    this.name = '',
  });
}

List testimonialDemo= [
  TestimonialModel(
      idUser: '1', idFood: '1', comment: 'This Is great, So delicious!  ', time: '20:00', star: 5, image: 'assets/images/chat1.png', name: 'Jaehyun'),
  TestimonialModel(
      idUser: '2', idFood: '2', comment: 'This Is great, So delicious!', time: '21:00', star: 5, image: 'assets/images/chat2.png', name: 'Guy Hawkins'),
  TestimonialModel(
      idUser: '3', idFood: '1', comment: 'This Is great, So delicious!', time: '22:00', star: 5, image: 'assets/images/chat3.png', name: 'Mina'),
  TestimonialModel(
      idUser: '4', idFood: '3', comment: 'This Is great, So delicious! ', time: '10:00', star: 5, image: 'assets/images/chat1.png', name: 'Nayeon'),
  TestimonialModel(
      idUser: '5', idFood: '4', comment: 'This Is great, So delicious!  ', time: '9:00', star: 5, image: 'assets/images/chat2.png', name: 'Momo'),
  TestimonialModel(
      idUser: '6', idFood: '3', comment: 'This Is great, So delicious! ', time: '8:00', star: 5, image: 'assets/images/chat3.png', name: 'Jungkook'),



];
