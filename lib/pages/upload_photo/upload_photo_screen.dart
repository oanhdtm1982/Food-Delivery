import 'package:flutter/material.dart';
import 'package:food_delivery/pages/upload_photo/components/body_upload_photo.dart';
import 'package:food_delivery/widgets/size_config.dart';

class UploadPhotoScreen extends StatelessWidget {
  static String routeName = '/UploadPhotoScreen';
  const UploadPhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyUploadPhoto(),
    );
  }
}