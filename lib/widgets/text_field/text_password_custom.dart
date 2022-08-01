import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';

// ignore: must_be_immutable
class TextPasswordCustom extends StatelessWidget {
  TextPasswordCustom(
      {Key? key,
      required this.onChanged,
      required this.colorBackground,
      required this.colorIcon,
      required this.hintTextPassword})
      : super(key: key);
  final ValueChanged<String> onChanged;
  final Color colorBackground;
  final Color colorIcon;
  final String hintTextPassword;
  String kPassNullError = "Please enter your password";
  String kShortPassError = "Password is too short";
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      colorBackground: colorBackground,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return kPassNullError;
          } else if (value.length < 6) {
            return kShortPassError;
          }
          return null;
        },
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              Icons.password_outlined,
              color: colorIcon,
            ),
            hintText: hintTextPassword,
            border: InputBorder.none,
            suffixIcon: Icon(Icons.visibility, color: colorIcon)),
      ),
    );
  }
}
