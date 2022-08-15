import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';

// ignore: must_be_immutable
class TextPasswordCustom extends StatefulWidget {
  const TextPasswordCustom({
    Key? key,
    required this.onChanged,
    required this.colorBackground,
    required this.colorIcon,
    required this.hintTextPassword,
  }) : super(key: key);
  final ValueChanged<String> onChanged;
  final Color colorBackground;
  final Color colorIcon;
  final String hintTextPassword;

  @override
  State<TextPasswordCustom> createState() => _TextPasswordCustomState();
}

class _TextPasswordCustomState extends State<TextPasswordCustom> {
  bool _showPass = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      colorBackground: widget.colorBackground,
      child: TextFormField(
        obscureText: !_showPass,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            icon: Icon(
              Icons.password_outlined,
              color: widget.colorIcon,
            ),
            hintText: widget.hintTextPassword,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
                onTap: onShowPass,
                child: Icon(_showPass ? Icons.visibility : Icons.visibility_off,
                    color: widget.colorIcon))),
      ),
    );
  }

  void onShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
