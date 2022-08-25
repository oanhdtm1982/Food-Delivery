import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/localization/app_localization.dart';
import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/pages/forgot_password/forgot_password_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_screen/sign_up_screen.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';
import 'package:food_delivery/widgets/text_field/text_password_custom.dart';
import 'package:food_delivery/widgets/screens/top_screen_sign.dart';

import '../../../blocs/credentials_bloc/credentials_bloc.dart';
import '../../../constants/colors/colors.dart';
import '../../../utils/validators.dart';

class BodySignIn extends StatefulWidget {
  static String routeName = '/BodySignIn';
  const BodySignIn({Key? key}) : super(key: key);

  @override
  State<BodySignIn> createState() => _BodySignInState();
}

class _BodySignInState extends State<BodySignIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String email;
  late String password;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void loginButtonPressed(BuildContext context) {
    context.watch<CredentialsBloc>().add(LoginButtonPressed(
        username: email.toString(), password: password.toString()));
  }

  void registerButtonPressed(BuildContext context) {
    context.watch<CredentialsBloc>().add(RegisterButtonPressed(
        username: email.toString(), password: password.toString()));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool validatePassword(String? input) {
    if (input!.length > 5) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(children: [
          const TopScreenSign(titleSign: 'Login to your account'),
          TextFieldCustom(
            colorBackground: appSecondaryColor,
            colorIcon: appPrimaryColor,
            onChanged: (value) {
              email = value;
            },
            hintText: 'Email',
            iconData: Icons.mail,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          TextPasswordCustom(
              hintTextPassword: 'Password',
              colorBackground: appSecondaryColor,
              colorIcon: appPrimaryColor,
              onChanged: (value) {
                password = value;
              }),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          const Text(
            'Or Continue With',
            style: TextStyle(
                fontFamily: 'BentonSans Bold',
                fontSize: 12,
                color: appTextColor),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: SizeConfig.screenWidth! * 0.4,
                decoration: BoxDecoration(
                    color: appPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 40,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.03,
                    ),
                    const Text(
                      'Facebook',
                      style: TextStyle(
                          fontFamily: 'BentonSans Medium', fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.04,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: SizeConfig.screenWidth! * 0.4,
                decoration: BoxDecoration(
                    color: appPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.googlePlus,
                      color: Colors.red,
                      size: 40,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.03,
                    ),
                    const Text(
                      'Google',
                      style: TextStyle(
                          fontFamily: 'BentonSans Medium', fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.04,
          ),
          ButtonCustom(
            title: 'Login',
            onPress: () {
              final bool isValid = EmailValidator.validate(email);
              final bool isValidPassword = validatePassword(password);
              if (isValid && isValidPassword) {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Row(
                    children: const <Widget>[
                      CircularProgressIndicator(),
                      Text("  Signing-In...")
                    ],
                  ),
                ));
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.toString(), password: password.toString())
                    .then((value) {
                  Fluttertoast.showToast(
                          msg: "Login Successful",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor:
                              const Color.fromRGBO(83, 232, 139, 1),
                          textColor: Colors.white,
                          fontSize: 16.0)
                      .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
                          context,
                          BottomBar.routeName,
                          (Route<dynamic> route) => false));
                }).catchError((error) {
                  Fluttertoast.showToast(
                      msg: "Login Failed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: const Color.fromRGBO(83, 232, 139, 1),
                      textColor: Colors.white,
                      fontSize: 16.0);
                });
              } else {
                Fluttertoast.showToast(
                    msg: "Invalid Email or Password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color.fromRGBO(83, 232, 139, 1),
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen()));
                  }),
                  child: const GradientText(
                    'Forgot Your Password?',
                    style: TextStyle(
                      fontFamily: 'BentonSans Medium',
                      fontSize: 15,
                    ),
                    gradient: LinearGradient(colors: [
                      appPrimaryColor,
                      appSecondaryColor,
                    ]),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.03,
                  height: SizeConfig.screenHeight! * 0.1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      }),
                      child: const GradientText(
                        'Create an account?',
                        style: TextStyle(
                          fontFamily: 'BentonSans Medium',
                          fontSize: 15,
                        ),
                        gradient: LinearGradient(colors: [
                          appPrimaryColor,
                          appSecondaryColor,
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
