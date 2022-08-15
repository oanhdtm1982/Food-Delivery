import 'package:flutter/material.dart';
import 'package:food_delivery/pages/chat_detail/chat_detail_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

import '../../../models/chat_model.dart';
import '../../../widgets/cards/chat_card.dart';
import '../../bottom_bar/bottom_bar.dart';

class BodyChat extends StatefulWidget {
  static String routeName = '/BodyChat';
  const BodyChat({Key? key}) : super(key: key);

  @override
  State<BodyChat> createState() => _BodyChatState();
}

class _BodyChatState extends State<BodyChat> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! * 0.05,
                  SizeConfig.screenHeight! * 0.05,
                  SizeConfig.screenWidth! * 0.05,
                  0),
              child: AppBarCustom(
                title: 'Chat',
                description: '',
                onPress: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      BottomBar.routeName, (Route<dynamic> route) => false);
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.screenWidth! * 1,
              width: SizeConfig.screenWidth! * 1,
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chatDemo.length,
                    itemBuilder: (context, index) => ChatCard(
                        chatModel: chatDemo[index],
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChatDetailScreen()));
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
