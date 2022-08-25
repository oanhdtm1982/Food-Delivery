import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/notifier/food_notifier.dart';
import 'package:food_delivery/notifier/restaurant_notifier.dart';
import 'package:food_delivery/pages/filter/filter_screen.dart';
import 'package:food_delivery/repositories/get_food.dart';
import 'package:food_delivery/widgets/size_config.dart';
import 'package:provider/provider.dart';

import '../../../models/food_model.dart';
import '../../food_detail/food_detail_screen.dart';

class SearchBarHome extends StatefulWidget {
  const SearchBarHome({Key? key}) : super(key: key);

  @override
  State<SearchBarHome> createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    RestaurantNotifier restaurantNotifier =
        Provider.of<RestaurantNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.screenWidth! * 0.12,
          width: SizeConfig.screenWidth! * 0.7,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: appBackgroundButtonColor.withOpacity(0.1),
              boxShadow: const [
                BoxShadow(color: Colors.white, blurRadius: 15)
              ]),
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: appButtonColor,
                ),
                border: InputBorder.none,
                hintText: 'What do you want to order?',
                hintStyle: TextStyle(
                  color: const Color.fromRGBO(218, 99, 23, 1).withOpacity(0.4),
                  fontSize: 12,
                ),
              ),
            ),
            suggestionsCallback: (String query) async {
              return foodNotifier.foodList
                  .where((food) {
                    final nameLower = food.foodName.toLowerCase();
                    final queryLower = query.toLowerCase();
                    return nameLower.contains(queryLower);
                  })
                  .map(
                    (e) => e.foodName,
                  )
                  .toList();
            },
            itemBuilder: (context, suggestion) {
              int index = foodNotifier.foodList.indexWhere((food) {
                return food.foodName == suggestion;
              });
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Image.network(
                      foodNotifier.foodList[index].foodUrlImage,
                      fit: BoxFit.cover,
                    ),
                    title: Text(suggestion.toString()),
                    subtitle: Text(
                      '\$${foodNotifier.foodList[index].price}',
                      style: const TextStyle(
                        color: appTextColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            onSuggestionSelected: (value) {
              int index = foodNotifier.foodList.indexWhere((food) {
                return food.foodName == value;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailScreen(
                    restaurantModel: restaurantNotifier.restaurantList[index],
                    foodModel: foodNotifier.foodList[index],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.03,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FilterScreen()));
          },
          child: Container(
              height: SizeConfig.screenWidth! * 0.12,
              width: SizeConfig.screenWidth! * 0.12,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: appBackgroundButtonColor.withOpacity(0.1),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, blurRadius: 15)
                  ]),
              child: Center(child: Image.asset('assets/images/Filter.png'))),
        ),
      ],
    );
  }
}
