import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({Key? key, required this.onPress, required this.title}) : super(key: key);
  final String title;
  final Function() onPress;

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(180),
      height: getProportionateScreenHeight(60),
      decoration: BoxDecoration(
        gradient: appLinearColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'BentonSans Bold',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}