import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/walkthrough/components/splash_screen.dart';
import 'package:food_delivery/routes/route.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'notifier/food_notifier.dart';
import 'notifier/restaurant_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FoodNotifier(),
        ),
        ChangeNotifierProvider(create: (context) => RestaurantNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food',
        theme: ThemeData.light().copyWith(
          primaryColor: appPrimaryColor,
          shadowColor: appPrimaryColor,
        ),
        routes: routes,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
