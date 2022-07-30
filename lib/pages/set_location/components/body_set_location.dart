import 'package:flutter/material.dart';
import 'package:food_delivery/pages/set_location/components/set_location_card.dart';
import 'package:food_delivery/pages/upload_preview/upload_preview_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodySetLocation extends StatelessWidget {
  static String routeName = '/BodySetLocation';
  const BodySetLocation({Key? key}) : super(key: key);

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
                title: 'Set Your Location ',
                description:
                    'This data will be displayed in your account profile for security',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UploadPreviewScreen()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              SetLocationCard(
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
