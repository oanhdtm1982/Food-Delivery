import 'package:flutter/material.dart';
import 'package:food_delivery/pages/profile/components/detail_profile.dart';
import 'package:food_delivery/pages/profile/components/image_profile.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyProfile extends StatelessWidget {
  static String routeName = '/BodyProfile';
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
         
          children: const[
            ImageProfile(),
            Center(child: DetailProfile())
          ],
        )
      ),
    );
  }
}
