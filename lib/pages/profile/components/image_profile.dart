import 'package:flutter/material.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.4,
      width: SizeConfig.screenWidth! * 1,
      child: Image.asset(userModel.userUrlImage!, fit: BoxFit.cover),
    );
  }
}
