import 'package:flutter/material.dart';
import 'package:food_delivery/pages/chat/components/body_chat.dart';
import 'package:food_delivery/widgets/size_config.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = '/ChatScreen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: BodyChat(),
    );
  }
}