// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ContentWalkThrough extends StatelessWidget {
  const ContentWalkThrough({Key? key, this.title, this.text, this.image})
      : super(key: key);
  final title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          height: SizeConfig.screenHeight! * 0.6,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              wordSpacing: 2,
                fontFamily: 'BentonSans Bold',
                fontSize: 22),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(50),
              vertical: getProportionateScreenHeight(10)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'BentonSans Book', fontSize: 14),
          ),
        )
      ],
    );
  }
}