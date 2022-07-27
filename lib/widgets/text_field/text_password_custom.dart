

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';

class TextPasswordCustom extends StatelessWidget {
  const TextPasswordCustom({Key? key, required this.onChanged,
  required this.colorBackground,
  required this.colorIcon}) : super(key: key);
  final ValueChanged<String> onChanged;
  final Color colorBackground;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      colorBackground: colorBackground,
      child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration:  InputDecoration(
        icon: Icon(Icons.password_outlined, color: colorIcon,),
        hintText: 'Password',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.visibility, color: colorIcon)
      ),
    ),);
  }
}