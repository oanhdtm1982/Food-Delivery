import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/constants/styles/text_styles.dart';
import 'package:food_delivery/widgets/size_config.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var uid = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  var voucher = '';
  Future<void> getVoucher() async {
    await FirebaseFirestore.instance.collection("user").doc(uid?.uid).snapshots().listen((event) {
      setState(() {
        voucher = event.get("voucher");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    getVoucher();
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
              Text(
                'You have $voucher voucher',
                style: titleFood,
              )
            ],
          ),
        ),
      ),
    );
  }
}
