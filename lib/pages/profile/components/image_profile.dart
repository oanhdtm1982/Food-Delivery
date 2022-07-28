import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.4,
      width: SizeConfig.screenWidth! * 1,
      child: Image.asset('assets/images/PhotoProfile.png', fit: BoxFit.cover),
    );
  }
}
