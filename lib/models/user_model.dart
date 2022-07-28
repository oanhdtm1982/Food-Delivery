class UserModel {
  String idUser;
  String userName;
  String userUrlImage;
  String userEmail;

  UserModel({
    required this.userEmail,
    required this.idUser,
    required this.userName,
    required this.userUrlImage,
  });
}

List demoUsers = [
  UserModel(
      idUser: '1',
      userName: "Anam Wusono",
      userUrlImage: "assets/images/PhotoProfile.png",
      userEmail: "test@example.com"),
];
