import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../widgets/buttons/button_filter_text.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: SizeConfig.screenHeight! * 0.6,
          width: SizeConfig.screenWidth! * 1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ButtonText(
                  textFilter: 'Member Gold',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
