import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  String url =
      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1';
  @override
  void initState() {
    super.initState();
    var ref = FirebaseStorage.instance
        .ref('files/${FirebaseAuth.instance.currentUser?.uid}/avatar/');
    ref.getDownloadURL().then((loc) => setState(() => url = loc));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.35,
      width: SizeConfig.screenWidth! * 1,
      child: FancyShimmerImage(
        imageUrl: url,
        errorWidget: Image.network(
            'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
        boxFit: BoxFit.cover,
      ),
    );
  }
}
