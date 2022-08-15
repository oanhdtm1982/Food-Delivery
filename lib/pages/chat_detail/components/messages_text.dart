import 'package:flutter/material.dart';
import '../../../constants/colors/colors.dart';
import '../../../models/messages_model.dart';

class MessageText extends StatelessWidget {
  const MessageText({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, right: 7, left: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: appSecondaryColor.withOpacity(message.isSender ? 0.9 : 0.2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isSender ? Colors.white : Colors.black,
          ),
        ));
  }
}
