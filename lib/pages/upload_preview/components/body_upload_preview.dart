import 'package:flutter/material.dart';
import 'package:food_delivery/pages/set_location/set_location_screen.dart';
import 'package:food_delivery/pages/upload_preview/components/image_photo_profile.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodyUploadPreview extends StatefulWidget {
  static String routeName = '/BodyUploadPreview';
  const BodyUploadPreview({Key? key}) : super(key: key);

  @override
  State<BodyUploadPreview> createState() => _BodyUploadPreviewState();
}

class _BodyUploadPreviewState extends State<BodyUploadPreview> {
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
              const Center(
                child: ImagePhotoProfile(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          SetLocationScreen.routeName,
                          (Route<dynamic> route) => false);
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
