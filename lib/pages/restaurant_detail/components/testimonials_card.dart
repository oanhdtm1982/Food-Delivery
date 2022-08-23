import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/models/chat_model.dart';
import 'package:food_delivery/widgets/size_config.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    Key? key,
    required this.onPress,
    required this.chatModel,
  }) : super(key: key);
  final ChatModel chatModel;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
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
                  Image.asset(chatModel.chatUrlImage),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatModel.chatName,
                        style: titleFood,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(chatModel.messageLast, style: descRestaurantName),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          chatModel.time,
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
