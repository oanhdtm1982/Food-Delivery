import 'package:flutter/material.dart';
import 'package:food_delivery/pages/filter/components/body_filter.dart';
import 'package:food_delivery/widgets/size_config.dart';

class FilterScreen extends StatelessWidget {
  static String routeName = '/FilterScreen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyFilter(),
    );
  }
}