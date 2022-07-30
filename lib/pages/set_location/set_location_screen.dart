import 'package:flutter/material.dart';
import 'package:food_delivery/pages/set_location/components/body_set_location.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SetLocationScreen extends StatelessWidget {
  static String routeName = '/SetLocationScreen';
  const SetLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodySetLocation(),
    );
  }
}
