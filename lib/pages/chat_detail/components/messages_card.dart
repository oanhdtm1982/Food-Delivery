import 'package:flutter/material.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_audio.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_image.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_status.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_text.dart';

import '../../../models/messages_model.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Widget messageContaint(Message message) {
      switch (message.messageType) {
        case MessageType.text:
          return MessageText(message: message);
          // ignore: dead_code
          break;
        case MessageType.audio:
          return MessageAudio(message: message);
          // ignore: dead_code
          break;
        case MessageType.image:
          return const MessageImage();
          // ignore: dead_code
          break;
        default:
          return const SizedBox();
      }
    }

    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.isSender) ...[
          const SizedBox(width: 5),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/chat1.png"),
          ),
        ],
        messageContaint(message),
        if (message.isSender)
          MessageStatusDot(
            messageStatus: message.messageStatus,
          )
      ],
    );
  }
}
