import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ForgotPasswordOption extends StatelessWidget {
  const ForgotPasswordOption(
      {Key? key,
      required this.forgotPasswordUrlImage,
      required this.textForgotPassword,
      required this.descForgotPassword,
      required this.onPress})
      : super(key: key);
  final String forgotPasswordUrlImage;
  final String textForgotPassword;
  final String descForgotPassword;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 100,
        width: SizeConfig.screenWidth! * 1,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: appBackgroundButtonColor.withOpacity(0.1),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 15)]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 10, 16, 10),
          child: Row(
            children: [
              Image.asset(forgotPasswordUrlImage),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textForgotPassword,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'BentonSans Regular',
                      color: Color.fromRGBO(59, 59, 59, 0.3),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    descForgotPassword,
                    style: const TextStyle(
                        fontFamily: 'BentonSans Book',
                        fontSize: 16,
                        color: Colors.black),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
