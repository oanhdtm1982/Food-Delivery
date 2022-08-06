import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';

class AddSubButton extends StatefulWidget {
  const AddSubButton({Key? key}) : super(key: key);

  @override
  State<AddSubButton> createState() => _AddSubButtonState();
}

class _AddSubButtonState extends State<AddSubButton> {
  int _valueOrder = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      width: 100,
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  _valueOrder > 1 ? _valueOrder-- : _valueOrder;
                });
              },
              child: const SubButton()),
          const SizedBox(
            width: 16,
          ),
          Text(
            '$_valueOrder',
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(177, 26, 22, 22)),
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  _valueOrder++;
                });
              },
              child: const AddButton()),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

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

class SubButton extends StatelessWidget {
  const SubButton({Key? key}) : super(key: key);

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
