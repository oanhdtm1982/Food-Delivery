import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';

import '../../../widgets/buttons/button_next_custom.dart';

class BodyResetPassword extends StatefulWidget {
  static String routeName = '/BodyResetPassword';
  const BodyResetPassword({Key? key}) : super(key: key);

  @override
  State<BodyResetPassword> createState() => _BodyResetPasswordState();
}

class _BodyResetPasswordState extends State<BodyResetPassword> {
  final formKey = GlobalKey<FormState>();

  final passWord = TextEditingController();

  final confirmPassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = '';
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
                title: 'Reset your password here',
                description:
                    'Please enter your email address and we will send you a link to reset your password',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
                },
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              TextFieldCustom(
                colorBackground: appSecondaryColor,
                colorIcon: appPrimaryColor,
                onChanged: (value) {
                  email = value;
                },
                hintText: 'Email',
                iconData: Icons.mail,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    title: 'Next',
                    onPress: () {
                      final bool isValid = EmailValidator.validate(email);
                      if(isValid)
                        {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email)
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: 'Email sent',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: appPrimaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                SignInScreen.routeName,
                                    (Route<dynamic> route) => false);
                          }).catchError((error) {
                            print(error);
                          });
                        }
                      else
                        {
                          Fluttertoast.showToast(
                              msg: 'Invalid email',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: appPrimaryColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
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
