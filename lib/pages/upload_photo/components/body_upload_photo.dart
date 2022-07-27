import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/buttons/button_card.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodyUploadPhoto extends StatelessWidget {
  static String routeName = '/BodyUploadPhoto';
  const BodyUploadPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.screenWidth! * 0.05,
              SizeConfig.screenHeight! * 0.05,
              SizeConfig.screenWidth! * 0.05,
              0),
          child: Column(
            children: [
              AppBarCustom(
                title: 'Upload Your Photo Profile',
                description:
                    'This data will be displayed in your account profile for security',
                onPress: () {},
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              ButtonCard(
                urlImage: 'assets/images/GalleryIcon.png',
                onPress: () {},
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              ButtonCard(
                urlImage: 'assets/images/CameraIcon.png',
                onPress: () {},
              ),
              
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      // Navigator.pushNamedAndRemoveUntil(
                      //                 context,
                      //                 UploadPhotoScreen.routeName,
                      //                 (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
