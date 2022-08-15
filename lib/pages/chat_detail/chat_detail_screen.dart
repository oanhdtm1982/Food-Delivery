import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/chat_detail/components/messages_body.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ChatDetailScreen extends StatelessWidget {
  static String routeName = '/ChatDetailScreen';
  const ChatDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appSecondaryColor,
        automaticallyImplyLeading: false,
        title: Row(children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/chat1.png"),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text(
              "Anamwp",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              "Online",
              style: TextStyle(fontSize: 12),
            )
          ])
        ]),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.local_phone)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: const MessageBody(),
    );
  }
}
