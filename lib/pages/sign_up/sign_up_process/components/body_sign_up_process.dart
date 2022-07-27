import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/payment_method/payment_method_screen.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';

class BodySignUpProcess extends StatelessWidget {
  static String routeName = '/BodySignUpProcess';
  const BodySignUpProcess({Key? key}) : super(key: key);

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
                title: 'Fill in your bio to get started',
                description:
                    'This data will be displayed in your account profile for security',
                onPress: () {},
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.07,
              ),
              TextFieldCustom(
                  colorBackground: appBackgroundButtonColor,
                  colorIcon: appButtonColor,
                  hintText: 'First name',
                  iconData: Icons.drive_file_rename_outline_outlined,
                  onChanged: (value) {}),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
              TextFieldCustom(
                  colorBackground: appBackgroundButtonColor,
                  colorIcon: appButtonColor,
                  hintText: 'Last name',
                  iconData: Icons.drive_file_rename_outline_sharp,
                  onChanged: (value) {}),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
              ),
              TextFieldCustom(
                  colorBackground: appBackgroundButtonColor,
                  colorIcon: appButtonColor,
                  hintText: 'Mobile phone',
                  iconData: Icons.phone_android_sharp,
                  onChanged: (value) {}),
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
