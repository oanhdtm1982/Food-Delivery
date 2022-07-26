

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/widgets/size_config.dart';

class TitleGroup extends StatelessWidget {
  const TitleGroup({Key? key, required this.mainTitle}) : super(key: key);
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth!*0.05, 0, SizeConfig.screenWidth!*0.05, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(mainTitle, style: const TextStyle(
            fontFamily: 'BentonSans Bold',
            fontSize: 15,
            color: appTextColor
          ),),
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
      ),
    );
  }
}