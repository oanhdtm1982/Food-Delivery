import 'dart:async';

import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';

import '../../widgets/screens/success_notification.dart';
import 'package:flutter/material.dart';

class SuccessRegister extends StatefulWidget {
  const SuccessRegister({Key? key}) : super(key: key);

  @override
  State<SuccessRegister> createState() => _SuccessRegisterState();
}

class _SuccessRegisterState extends State<SuccessRegister> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, BottomBar.routeName, (route) => false);
    });

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessScreen(text: 'Register',)
    );
  }
}
