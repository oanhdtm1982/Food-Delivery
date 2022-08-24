import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/pages/chat/chat_screen.dart';
import 'package:food_delivery/pages/chat_detail/chat_detail_screen.dart';
import 'package:food_delivery/pages/explore_restaurant/explore_restaurant_screen.dart';
import 'package:food_delivery/pages/forgot_password/forgot_password_screen.dart';
import 'package:food_delivery/pages/payment_method/payment_method_screen.dart';
import 'package:food_delivery/pages/rate/rate_screen.dart';
import 'package:food_delivery/pages/reset_password/reset_password_screen.dart';
import 'package:food_delivery/pages/restaurant_detail/restaurant_detail_screen.dart';
import 'package:food_delivery/pages/set_location/set_location_screen.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_process/sign_up_process_screen.dart';
import 'package:food_delivery/pages/sign_up/sign_up_screen/sign_up_screen.dart';
import 'package:food_delivery/pages/upload_photo/upload_photo_screen.dart';
import 'package:food_delivery/pages/upload_preview/upload_preview_screen.dart';
import 'package:food_delivery/pages/verification_code/verification_code_screen.dart';
import 'package:food_delivery/pages/walkthrough/components/body_walkthrough.dart';
import 'package:food_delivery/pages/walkthrough/components/splash_screen.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (context) => const SplashScreen(),
  BodyWalkThrough.routeName: (context) => const BodyWalkThrough(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  BottomBar.routeName: (context) => const BottomBar(),
  SignUpProcessScreen.routeName: (context) => const SignUpProcessScreen(),
  VertificationCodeScreen.routeName: (context) =>
      const VertificationCodeScreen(),
  PaymentMethodScreen.routeName: (context) => const PaymentMethodScreen(),
  UploadPhotoScreen.routeName: (context) => const UploadPhotoScreen(),
  ExploreRestaurantScreen.routeName: (context) =>
      const ExploreRestaurantScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
  UploadPreviewScreen.routeName: (context) => const UploadPreviewScreen(),
  SetLocationScreen.routeName: (context) => const SetLocationScreen(),
  RateScreen.routeName: (context) => const RateScreen(),
  ChatScreen.routeName: (context) => const ChatScreen(),
  ChatDetailScreen.routeName: (context) => const ChatDetailScreen(),
};
