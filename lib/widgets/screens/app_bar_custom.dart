import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.description})
      : super(key: key);
  final Function onPress;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPress(),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: appBackgroundButtonColor.withOpacity(0.1),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: appButtonColor,
                size: 32,
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight!*0.04,
        ),
        Text(title,
            style: const TextStyle(
                fontFamily: 'BentonSans Bold',
                fontSize: 25,
                color: appTextColor)),
        SizedBox(
          height: SizeConfig.screenHeight!*0.02,
        ),
        Text(description,
            style: const TextStyle(
                fontFamily: 'BentonSans Book',
                fontSize: 12,
                color: appTextColor)),
      ],
    );
  }
}
