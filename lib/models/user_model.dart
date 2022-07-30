class UserModel {
  String? idUser;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? userUrlImage;
  String? userEmail;
  String? userAddress;

  UserModel({
    required this.userEmail,
    required this.idUser,
    required this.firstName,
    required this.lastName,
    required this.userUrlImage,
    required this.userAddress,
    required this.phoneNumber,
  });
}

List demoUsers = [
  UserModel(
      idUser: '1',
      firstName: "Anam Wusono",
      userUrlImage: "assets/images/PhotoProfile.png",
      userEmail: "test@example.com",
      lastName: 'Heung',
      phoneNumber: '',
      userAddress: ''),
];
