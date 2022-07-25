import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/components/top_bar_home.dart';
import 'package:food_delivery/widgets/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
          children: const [
            TopBarHome(),
          ],
        
      ),
    );
  }
}
