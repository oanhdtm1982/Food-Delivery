import 'dart:async';


import '../../widgets/screens/success_notification.dart';
import 'package:flutter/material.dart';

import '../sign_in/sign_in_screen.dart';

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
          context, SignInScreen.routeName, (route) => false);
    });

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessScreen(text: 'Your Profile Is Ready To Use',)
    );
  }
}
