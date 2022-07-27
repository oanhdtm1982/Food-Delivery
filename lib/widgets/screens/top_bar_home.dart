import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/home/components/search_bar_home.dart';
import 'package:food_delivery/widgets/size_config.dart';

class TopBarHome extends StatefulWidget {
  const TopBarHome({Key? key}) : super(key: key);

  @override
  State<TopBarHome> createState() => _TopBarScreenState();
}

class _TopBarScreenState extends State<TopBarHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(31, 50, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 31, 0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Find Your \nFavorite Food',
                style: TextStyle(
                    color: appTextColor,
                    fontSize: 31,
                    fontFamily: 'BentonSans Bold'),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(20, 78, 90, 0.1),
                              blurRadius: 15)
                        ]),
                    child: const Icon(
                      Icons.notifications,
                      color: appPrimaryColor,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          const SearchBarHome()
        ],
      ),
    );
  }
}
