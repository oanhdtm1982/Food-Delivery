import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/notifier/food_notifier.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

class SearchBarHome extends StatefulWidget {
  const SearchBarHome({Key? key}) : super(key: key);

  @override
  State<SearchBarHome> createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
        height: SizeConfig.screenWidth! * 0.12,
        width: SizeConfig.screenWidth!*0.7,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: appBackgroundButtonColor.withOpacity(0.1),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 15)]),
        child: TypeAheadField(
          textFieldConfiguration:  TextFieldConfiguration(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: appButtonColor,
              ),
              border: InputBorder.none,
              hintText: 'What do you want to order?', hintStyle: TextStyle(
                color: const Color.fromRGBO(218, 99, 23, 1).withOpacity(0.4),
                fontSize: 12,
              ),
            ),
          ),
          suggestionsCallback: (String query) async {
            return foodNotifier.foodList.where((food) {
              final nameLower = food.name.toLowerCase();
              final queryLower = query.toLowerCase();
              return nameLower.contains(queryLower);
            }).toList();
          },
          itemBuilder: (context, suggestion) {
            return const ListTile(
              leading: Icon(Icons.food_bank_sharp),
            );
          },
          onSuggestionSelected: (value) {},
        ),
      ),
      SizedBox(width: SizeConfig.screenWidth!*0.03,),
      Container(
                height: SizeConfig.screenWidth! * 0.12,
                width: SizeConfig.screenWidth! * 0.12,
                decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: appBackgroundButtonColor.withOpacity(0.1),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white, blurRadius: 15)
                    ]),
                child: Center(child: Image.asset('assets/images/Filter.png'))
              ),
      ],
    );
  }
}
