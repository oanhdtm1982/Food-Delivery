import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/cart/cart_screen.dart';

class AddSubButton extends StatefulWidget {
  const AddSubButton({Key? key, required this.quantity, required this.foodName})
      : super(key: key);
  final int quantity;
  final String foodName;
  @override
  State<AddSubButton> createState() => _AddSubButtonState();
}

class _AddSubButtonState extends State<AddSubButton> {
  @override
  initState() {
    super.initState();
    build(context);
  }
  @override
  Widget build(BuildContext context) {
    int valueOrder = widget.quantity;
    var uid = FirebaseAuth.instance.currentUser;
    DatabaseReference ref = FirebaseDatabase.instance
        .ref(uid!.uid)
        .child('Cart')
        .child(widget.foodName);
    return SizedBox(
      height: 26,
      width: 100,
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  if (valueOrder > 1) {
                    valueOrder--;
                    ref.update({'quantity': valueOrder--});
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                  } else {
                    ref.update({'quantity': valueOrder});
                  }
                });
              },
              child: const SubButton()),
          const SizedBox(
            width: 16,
          ),
          Text(
            '$valueOrder',
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(177, 26, 22, 22)),
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  valueOrder++;
                  ref.update({'quantity': valueOrder++});
                  build(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                });
              },
              child: const AddButton()),
        ],
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: const BoxDecoration(
          gradient: appLinearColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(20, 78, 90, 0.2), blurRadius: 15)
          ]),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}

class SubButton extends StatefulWidget {
  const SubButton({Key? key}) : super(key: key);

  @override
  State<SubButton> createState() => _SubButtonState();
}

class _SubButtonState extends State<SubButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
          gradient: appLinearColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white.withOpacity(0.1),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(20, 78, 90, 0.1), blurRadius: 15)
          ]),
      child: const Icon(
        Icons.remove,
        color: appPrimaryColor,
        size: 16,
      ),
    );
  }
}
