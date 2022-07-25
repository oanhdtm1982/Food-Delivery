import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/walkthrough/components/splash_screen.dart';
import 'package:food_delivery/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food',
      theme: ThemeData.light().copyWith(
        primaryColor: appPrimaryColor,
        shadowColor: appPrimaryColor,
      ),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}

