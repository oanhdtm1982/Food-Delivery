import 'package:flutter/material.dart';
import 'package:food_delivery/models/testimonial_model.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/styles/text_styles.dart';
import '../../../widgets/size_config.dart';

class TestimonialsCard extends StatelessWidget {
  const TestimonialsCard({Key? key, required this.testimonialModel})
      : super(key: key);
  final TestimonialModel testimonialModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
          height: SizeConfig.screenWidth! * 0.2,
          width: SizeConfig.screenWidth! * 0.4,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: appBackgroundButtonColor.withOpacity(0.1),
              boxShadow: const [
                BoxShadow(color: Colors.white, blurRadius: 15)
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/food_1.png'),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'chatModel.chatName',
                      style: titleFood,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('chatModel.messageLast', style: descRestaurantName),
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'chatModel.time',
                        textAlign: TextAlign.right,
                        style: descRestaurantName,
                      )),
                )),
              ],
            ),
          )),
    );
  }
}
