import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/payment_method/payment_method_screen.dart';
import 'package:food_delivery/pages/upload_preview/upload_preview_screen.dart';
import 'package:food_delivery/widgets/buttons/button_card.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import '../../../widgets/buttons/button_next_custom.dart';

class BodyUploadPhoto extends StatefulWidget {
  static String routeName = '/BodyUploadPhoto';
  const BodyUploadPhoto({Key? key}) : super(key: key);

  @override
  State<BodyUploadPhoto> createState() => _BodyUploadPhotoState();
}

class _BodyUploadPhotoState extends State<BodyUploadPhoto> {
  File? image;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  var uid = FirebaseAuth.instance.currentUser?.uid;
  Future pickImage(ImageSource imageSoure) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSoure);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        uploadFile();
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }
  Future uploadFile() async {
    if (image == null) return;
    final destination = 'files/$uid';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('avatar/');
      await ref.putFile(image!);
    } catch (e) {
      print('error occured');
    }
  }
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
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PaymentMethodScreen()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              ButtonCard(
                urlImage: 'assets/images/GalleryIcon.png',
                onPress: () => pickImage(ImageSource.gallery),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              ButtonCard(
                urlImage: 'assets/images/CameraIcon.png',
                onPress: () => pickImage(ImageSource.camera),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                      title: 'Next', onPress: (() => uploadImage(context))),
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

  Future uploadImage(BuildContext context) async {
    Navigator.pushNamed(context, UploadPreviewScreen.routeName);
  }
}
