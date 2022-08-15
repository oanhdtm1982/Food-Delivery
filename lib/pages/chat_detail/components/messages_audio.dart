import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';

import '../../../models/messages_model.dart';

class MessageAudio extends StatelessWidget {
  const MessageAudio({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      margin: const EdgeInsets.only(top: 10, right: 7, left: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: appSecondaryColor.withOpacity(message.isSender ? 1 : 0.3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : appSecondaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 3,
                color: message.isSender
                    ? appSecondaryColor
                    : appSecondaryColor.withOpacity(0.5),
              ),
              Positioned(
                left: 0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: appSecondaryColor, shape: BoxShape.circle),
                ),
              )
            ],
          )),
          const SizedBox(
            width: 10,
          ),
          Text(
            "0.37",
            style: TextStyle(
                color: message.isSender ? Colors.white : appSecondaryColor,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
