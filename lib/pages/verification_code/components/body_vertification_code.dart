import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/payment_method/payment_method_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/sign_up_process_screen.dart';
import 'package:food_delivery/pages/verification_code/components/otp_text_filed.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:path/path.dart';
import '../../../widgets/buttons/button_next_custom.dart';

class BodyVertificationCode extends StatefulWidget {
  static String routeName = '/BodyVertificationCode';
  const BodyVertificationCode({Key? key}) : super(key: key);

  @override
  State<BodyVertificationCode> createState() => _BodyVertificationCodeState();
}

class _BodyVertificationCodeState extends State<BodyVertificationCode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDownTimer();
  }
  var currentTime = 90;
  void countDownTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (currentTime < 1) {
          timer.cancel();
        } else {
          currentTime = currentTime - 1;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              SizeConfig.screenWidth! * 0.05,
              SizeConfig.screenHeight! * 0.05,
              SizeConfig.screenWidth! * 0.05,
              0),
          child: Column(
            children: [
              AppBarCustom(
                title: 'Enter 4-digit Verification code',
                description:
                    'Code send to your phone. This code will expired in $currentTime seconds',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpProcessScreen()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              const OtpTextFiledForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          PaymentMethodScreen.routeName,
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
