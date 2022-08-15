import 'package:flutter/material.dart';

class MessageImage extends StatelessWidget {
  const MessageImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Image.asset("assets/images/chat1.png"),
      ),
    );
  }
}
