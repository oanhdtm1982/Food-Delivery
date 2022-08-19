import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/sign_up_process_screen.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/gradient_text.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';
import 'package:food_delivery/widgets/text_field/text_password_custom.dart';
import 'package:food_delivery/widgets/screens/top_screen_sign.dart';
class BodySignUp extends StatefulWidget {
  static String routeName = '/BodySignUp';
  const BodySignUp({Key? key}) : super(key: key);

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  late String email;
  late String password;
  late String username;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(children: [
            const TopScreenSign(titleSign: 'Sign Up For Free'),
            TextFieldCustom(
              colorBackground: appSecondaryColor,
              colorIcon: appPrimaryColor,
              onChanged: (value) {
                username = value;
              },
              hintText: 'Username',
              iconData: Icons.person,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.02,
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
              height: SizeConfig.screenHeight! * 0.04,
            ),
            ButtonCustom(
              title: 'Create Account',
              onPress: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  duration: const Duration(seconds: 4),
                  content: Row(
                    children: const <Widget>[
                      CircularProgressIndicator(),
                      Text("Please Wait...")
                    ],
                  ),
                ));
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.toString(), password: password.toString())
                  .then((user) {
                Fluttertoast.showToast(
                    msg: "Sign Up Successful",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor:  const Color.fromRGBO(83, 232, 139, 1),
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                var uid = FirebaseAuth.instance.currentUser;
                CollectionReference users = FirebaseFirestore.instance.collection('user');
                users.doc(uid?.uid).set(
                  {
                    'user_name':username,
                  }
                ).then((user){

                })
                    .catchError((error){
                });
              })
                  .catchError((error){
                Fluttertoast.showToast(
                    msg: "Sign Up Failed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor:  const Color.fromRGBO(83, 232, 139, 1),
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }).whenComplete(() =>
                  Navigator.pushNamedAndRemoveUntil(context,
                      SignUpProcessScreen.routeName, (Route<dynamic> route) => false));
              }
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignInScreen()));
              },
              child: const GradientText(
                'Already have an account?',
                style: TextStyle(
                  fontFamily: 'BentonSans Medium',
                  fontSize: 12,
                ),
                gradient: LinearGradient(colors: [
                  appPrimaryColor,
                  appSecondaryColor,
                ]),
              ),
            ),
          ]),
        ));
  }
}

