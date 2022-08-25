import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:provider/provider.dart';

import '../../../notifier/cart_notifier.dart';
import '../../../repositories/get_cart.dart';
import '../../../widgets/gradient_text.dart';
import '../../../widgets/size_config.dart';
import '../../success_screens/purchased_success.dart';

class TotalOrderPayment extends StatefulWidget {
  const TotalOrderPayment({Key? key}) : super(key: key);

  @override
  State<TotalOrderPayment> createState() => _TotalOrderPaymentState();
}

class _TotalOrderPaymentState extends State<TotalOrderPayment> {
  double subtotal = 0;
  double deliveryCharge = 0;
  double discount = 0;
  double total = 0;
  var uid = FirebaseAuth.instance.currentUser;
  String address = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartNotifier cartNotifier =
        (Provider.of<CartNotifier>(context, listen: false));
    getCartFoods(cartNotifier);
    subtotal = cartNotifier.totalAmount();
    getName();
  }
  Future<void> getName() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(uid?.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        address = event.get("address");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    setState(() {
      subtotal = cartNotifier.totalAmount();
      deliveryCharge = subtotal * 0.1;
      if (subtotal >= 150) {
        discount = subtotal * 0.2;
      }
      total = subtotal + deliveryCharge - discount;
    });

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
            TextTotalOrder(
                title: 'Delivery Charge', price: '$deliveryCharge\$'),
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
              onPress: () {
                DatabaseReference ref = FirebaseDatabase.instance
                    .ref(uid!.uid)
                    .child('Purchased')
                    .child((DateTime.now().millisecondsSinceEpoch).toString());
                ref.set({
                  'Subtotal': subtotal,
                  'Delivery Charge': deliveryCharge,
                  'Discount': discount,
                  'Total': total,
                  'Address': address,
                });
                FirebaseDatabase.instance
                    .ref(uid!.uid)
                    .child('Cart').remove();
                Fluttertoast.showToast(
                    msg: 'Order Placed',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color.fromRGBO(83, 232, 139, 1),
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PurchasedSuccess()));
              },
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
