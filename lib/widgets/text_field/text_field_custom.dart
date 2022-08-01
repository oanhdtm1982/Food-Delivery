import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {Key? key,
      required this.hintText,
      required this.iconData,
      required this.onChanged,
      required this.colorBackground,
      required this.colorIcon, 
      required this.regExpTextField, 
      required this.errorNullTextField, 
      required this.errorInvalidTextField})
      : super(key: key);
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final Color colorBackground;
  final Color colorIcon;
  final RegExp regExpTextField;
  final String errorNullTextField;
  final String errorInvalidTextField;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      colorBackground: colorBackground,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorNullTextField;
          } else if (!regExpTextField.hasMatch(value)) {
            return errorInvalidTextField;
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            iconData,
            color: colorIcon.withOpacity(0.7),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.colorBackground,
  }) : super(key: key);
  final Widget child;
  final Color colorBackground;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: SizeConfig.screenWidth! * 0.9,
      decoration: BoxDecoration(
          color: colorBackground.withOpacity(0.15),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
