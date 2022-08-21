import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../constants/styles/text_styles.dart';
import '../../../widgets/buttons/button_filter_text.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight! * 0.7,
            width: SizeConfig.screenWidth! * 1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      ButtonText(
                        textFilter: 'Popular',
                      ),
                    ],
                  ),
                  const Text(
                    'Wijie Bar and Resto',
                    style: textNameProfile,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
                    style: textDescriptionRestaurant,
                  ),
                  Row(
                    children: const[],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
