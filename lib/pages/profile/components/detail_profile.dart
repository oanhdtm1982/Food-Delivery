import 'package:flutter/material.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/pages/profile/components/body_detail_profile.dart';
import 'package:food_delivery/widgets/size_config.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: SizeConfig.screenHeight! * 0.6,
          width: SizeConfig.screenWidth! * 1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            color: Colors.white,
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: BodyDetailProfile(
                userModel: demoUsers[0],
              )),
        ),
      ),
    );
  }
}
