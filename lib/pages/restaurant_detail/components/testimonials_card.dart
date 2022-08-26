import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../models/testimonial_model.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    Key? key,
    required this.onPress,
    required this.testimonialModel,
  }) : super(key: key);
  final TestimonialModel testimonialModel;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
            height: SizeConfig.screenWidth! * 0.2,
            width: SizeConfig.screenWidth! * 0.5,
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
                  Image.asset(testimonialModel.image,
                      height: SizeConfig.screenWidth! * 0.1),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonialModel.name,
                        style: titleFood,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        testimonialModel.comment,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          testimonialModel.time,
                          textAlign: TextAlign.right,
                          style: descRestaurantName,
                        )),
                  )),
                ],
              ),
            )),
      ),
    );
  }
}
