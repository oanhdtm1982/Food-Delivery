
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_card.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_input.dart';

import '../../../models/messages_model.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              
              itemCount:  demoMessages.length,
                itemBuilder: ((context, index) => MessageCard(message: demoMessages[index])))),
        const MessageInput()
      ],
    );
  }
}
