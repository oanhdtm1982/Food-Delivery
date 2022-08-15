import 'package:flutter/material.dart';
import '../../../constants/colors/colors.dart';
import '../../../models/messages_model.dart';

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({Key? key, required this.messageStatus})
      : super(key: key);
  final MessageStatus messageStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 5, 0),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          color: messageStatus == MessageStatus.not_sent
              ? Colors.redAccent
              : appSecondaryColor,
          shape: BoxShape.circle),
      child: Icon(
        messageStatus == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Colors.white,
      ),
    );
  }
}
