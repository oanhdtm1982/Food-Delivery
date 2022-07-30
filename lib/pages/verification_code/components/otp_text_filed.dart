import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:food_delivery/constants/colors/colors.dart';

class OtpTextFiledForm extends StatelessWidget {
  const OtpTextFiledForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      borderColor: appSecondaryColor,
      focusedBorderColor: appPrimaryColor,
      showFieldAsBox: true,
      textStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'BentonSans Medium',
      ),
      decoration: const InputDecoration(),
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
              );
            });
      },
    );
  }
}
