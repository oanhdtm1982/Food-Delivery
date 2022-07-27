import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';

class SubButton extends StatelessWidget {
  const SubButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration:  BoxDecoration(
        gradient:  const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [Color.fromRGBO(83, 232, 139, 1), Color.fromRGBO(21, 190, 119, 1)]),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white.withOpacity(0.1),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(20, 78, 90, 0.1), blurRadius: 15)
          ]),
      child: const Icon(
        Icons.remove,
        color: appPrimaryColor,
        size: 16,
      ),
    );
  }
}
