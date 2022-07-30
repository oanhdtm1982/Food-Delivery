import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ImagePhotoProfile extends StatelessWidget {
  const ImagePhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth! * 0.7,
      width: SizeConfig.screenWidth! * 0.7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: appBackgroundButtonColor.withOpacity(0.1),
          boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 22)]),
      child: Stack(alignment: Alignment.topRight, children: [
        Image.asset(
          'assets/images/PhotoProfile.png',
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTap: (){
            
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
