import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: const BoxDecoration(
        gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [appPrimaryColor, appSecondaryColor]),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(20, 78, 90, 0.2), blurRadius: 15)
          ]),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
