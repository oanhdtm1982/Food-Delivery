import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.urlImage, required this.onPress}) : super(key: key);
  final String urlImage;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 7;
    return GestureDetector(
      onTap: onPress(),
      child: Container(
        height: size.height,
        width: SizeConfig.screenWidth! * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: appBackgroundButtonColor.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                blurRadius: 22,
              )
            ]),
        child: Center(
          child: Image.asset(urlImage),
        ),
      ),
    );
  }
}
