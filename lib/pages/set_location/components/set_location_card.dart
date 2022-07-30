import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/widgets/size_config.dart';

class SetLocationCard extends StatelessWidget {
  const SetLocationCard({Key? key, required this.onPress}) : super(key: key);
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: SizeConfig.screenWidth! * 1,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: appBackgroundButtonColor.withOpacity(0.1),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 22)]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/location.png'),
                  const SizedBox(
                    width: 14,
                  ),
                  const Text(
                    'Your Location',
                    style: titleFood,
                  )
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              GestureDetector(
                onTap: onPress,
                child: Container(
                  width: SizeConfig.screenWidth! * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(90, 108, 234, 0.07),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Set Location',
                      style: TextStyle(
                        color: appTextColor,
                        fontFamily: 'Viga',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
