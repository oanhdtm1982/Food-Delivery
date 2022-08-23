import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:provider/provider.dart';

import '../../../notifier/cart_notifier.dart';
import '../../../repositories/get_food.dart';
import '../../../widgets/gradient_text.dart';
import '../../../widgets/size_config.dart';

class TotalOrder extends StatefulWidget {
  const TotalOrder({Key? key}) : super(key: key);

  @override
  State<TotalOrder> createState() => _TotalOrderState();
}

class _TotalOrderState extends State<TotalOrder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartNotifier cartNotifier =
    (Provider.of<CartNotifier>(context, listen: false));
    getCartFoods(cartNotifier);

  }
  @override
  Widget build(BuildContext context) {
    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    double subtotal = 0;
    double deliveryCharge = 0;
    double discount = 0;
    double total = 0;
    subtotal = cartNotifier.totalAmount();
    if(subtotal > 0){
      deliveryCharge = subtotal * 0.1;
    }
    total = subtotal + deliveryCharge - discount;
    return Container(
      decoration: const BoxDecoration(
        gradient: appLinearColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTotalOrder(title: 'Sub-Total', price: '$subtotal\$'),
            TextTotalOrder(title: 'Delivery Charge', price: '$deliveryCharge\$'),
            TextTotalOrder(title: 'Discount', price: '$discount\$'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'BentonSans Medium',
                        fontSize: 18),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$total\$',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'BentonSans Medium',
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonOrder(
              onPress: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class TextTotalOrder extends StatelessWidget {
  const TextTotalOrder({Key? key, required this.title, required this.price})
      : super(key: key);
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans Medium',
                fontSize: 14),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    price,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'BentonSans Medium',
                        fontSize: 14),
                  ))),
        ],
      ),
    );
  }
}

class ButtonOrder extends StatelessWidget {
  const ButtonOrder({Key? key, required this.onPress}) : super(key: key);
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: SizeConfig.screenWidth! * 0.9,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: GradientText(
            'Place My Order',
            style: TextStyle(fontFamily: 'BentonSans Bold', fontSize: 14),
            gradient: LinearGradient(colors: [
              appPrimaryColor,
              appSecondaryColor,
            ]),
          ),
        ),
      ),
    );
  }
}
