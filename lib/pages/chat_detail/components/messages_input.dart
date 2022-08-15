import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration:
          BoxDecoration(color: Colors.white.withOpacity(0.2), boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: appSecondaryColor.withOpacity(0.4))
      ]),
      child: SafeArea(
          child: Row(
        children: [
          const Icon(Icons.mic, color: appSecondaryColor),
          const SizedBox(width: 7),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: appSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(children: const [
                Icon(Icons.sentiment_satisfied_alt_outlined,
                    color: appSecondaryColor),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Type message",
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(24, 24, 24, 1)),
                        border: InputBorder.none),
                  ),
                ),
                Icon(
                  Icons.attach_file,
                  color: appSecondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.camera_alt_outlined,
                  color: appSecondaryColor,
                )
              ]),
            ),
          )
        ],
      )),
    );
  }
}
