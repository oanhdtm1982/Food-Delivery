

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';

class TitleGroup extends StatelessWidget {
  const TitleGroup({Key? key, required this.mainTitle}) : super(key: key);
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(mainTitle, style: titleGroup,),
        const Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('View More', style: TextStyle(
              fontFamily: 'BentonSans Book',
              fontSize: 12,
              color: appTextViewMore
            ),),
          ),
        ),
      ],
    );
  }
}