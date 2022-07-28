import 'package:flutter/material.dart';
import 'package:food_delivery/pages/profile/components/body_profile.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyProfile(),
    );
  }
}