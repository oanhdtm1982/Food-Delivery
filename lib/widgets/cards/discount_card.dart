import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/widgets/size_config.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        height: 64,
        width: SizeConfig.screenWidth! * 1,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: appBackgroundButtonColor.withOpacity(0.1),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 15)]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            children: [
              Image.asset('assets/images/VoucherIcon.png'),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'You have 3 voucher',
                style: titleFood,
              )
            ],
          ),
        ),
      ),
    );
  }
}
