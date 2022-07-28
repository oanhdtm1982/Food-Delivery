import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';

class AddSubButton extends StatelessWidget {
  const AddSubButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          SubButton(),
          SizedBox(
            width: 16,
          ),
          Text(
            '1',
            style:
                TextStyle(fontSize: 16, color: Color.fromRGBO(24, 24, 24, 0.7)),
          ),
          SizedBox(
            width: 16,
          ),
          AddButton(),
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
