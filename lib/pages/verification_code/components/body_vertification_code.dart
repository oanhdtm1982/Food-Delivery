import 'package:flutter/material.dart';
import 'package:food_delivery/pages/payment_method/payment_method_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/sign_up_process_screen.dart';
import 'package:food_delivery/pages/verification_code/components/otp_text_filed.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import '../../../widgets/buttons/button_next_custom.dart';

class BodyVertificationCode extends StatefulWidget {
  static String routeName = '/BodyVertificationCode';
  const BodyVertificationCode({Key? key}) : super(key: key);

  @override
  State<BodyVertificationCode> createState() => _BodyVertificationCodeState();
}

class _BodyVertificationCodeState extends State<BodyVertificationCode> {
  late int timerCount;
  countDownTimer() async {

    for (int x = 90; x > 0; x--) {
      await Future.delayed(const Duration(seconds: 1)).then((_) {
        setState(() {
          timerCount -= 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    countDownTimer();
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
                    'Code send to your mobile phone. This code will expired in $timerCount seconds',
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
