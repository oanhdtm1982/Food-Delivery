import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/pages/payments/components/total_order_payment.dart';
import 'package:food_delivery/widgets/screens/app_bar_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';


class BodyPayments extends StatefulWidget {
  static String routeName = '/BodyCart';
  const BodyPayments({Key? key}) : super(key: key);

  @override
  State<BodyPayments> createState() => _BodyPaymentState();
}

class _BodyPaymentState extends State<BodyPayments> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var uid = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  var address = '';
  @override
  void initState() {
    super.initState();
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
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size / 7;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth! * 0.05,
                  SizeConfig.screenHeight! * 0.05,
                  SizeConfig.screenWidth! * 0.05,
                  0),
              child: AppBarCustom(
                title: 'Confirm Order',
                description: '',
                onPress: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      BottomBar.routeName, (Route<dynamic> route) => false);
                },
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size.height,
                  width: SizeConfig.screenWidth! * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          blurRadius: 22,
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.06,
                          ),
                          Text(
                            'Deliver To',
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight! * 0.02,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'BentonSans Medium',
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.6,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight! * 0.02,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'BentonSans Medium',
                                  color: const Color.fromRGBO(83, 232, 139, 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.055,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.08,
                          ),
                          const Icon(Icons.location_on, color: Colors.red),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.05,
                          ),
                          Text(
                            address,
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight! * 0.02,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(83, 232, 139, 1),
                                fontFamily: 'BentonSans Medium',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                Container(
                  height: size.height,
                  width: SizeConfig.screenWidth! * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          blurRadius: 22,
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.06,
                          ),
                          Text(
                            'Payment Method',
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight! * 0.02,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'BentonSans Medium',
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.45,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight! * 0.02,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'BentonSans Medium',
                                  color: const Color.fromRGBO(83, 232, 139, 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenWidth! * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.06,
                          ),
                          Image.asset(
                            'assets/images/visa.png',
                            height: SizeConfig.screenHeight! * 0.02,
                            width: SizeConfig.screenWidth! * 0.15,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.32,
                          ),
                          Text(
                            '2121 6352 8465 ****',
                            style: TextStyle(
                              fontSize: SizeConfig.screenHeight! * 0.02,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(83, 232, 139, 1),
                              fontFamily: 'BentonSans Medium',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
            const TotalOrderPayment(),
          ],
        ),
      ),
    );
  }
}
