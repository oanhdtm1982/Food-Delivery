import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({Key? key, required this.textFilter}) : super(key: key);
  final String textFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromRGBO(254, 173, 29, 0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
            child: Center(
                child: Text(textFilter,
                    style: const TextStyle(
                        color: appButtonColor,
                        fontSize: 12,
                        fontFamily: 'BentonSans Medium'))),
          )),
    );
  }
}
