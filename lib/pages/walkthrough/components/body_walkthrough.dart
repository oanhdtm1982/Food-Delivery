import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/sign_in/sign_in_screen.dart';
import 'package:food_delivery/pages/walkthrough/components/content_walkthrough.dart';
import 'package:food_delivery/widgets/buttons/button_next_custom.dart';
import 'package:food_delivery/widgets/size_config.dart';

class BodyWalkThrough extends StatefulWidget {
  static String routeName = '/body_walkthrough';
  const BodyWalkThrough({Key? key}) : super(key: key);

  @override
  State<BodyWalkThrough> createState() => _BodyWalkThroughState();
}

class _BodyWalkThroughState extends State<BodyWalkThrough> {
  int indexPage = 0;
  // ignore: prefer_final_fields, unused_field
  PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> walkthroughData = [
    {
      'image': 'assets/images/Illustartion1.png',
      'title': 'Find your Comfort Food here',
      'text':
          'Here You Can find a chef or dish for every taste and color. Enjoy!'
    },
    {
      'image': 'assets/images/Illustration2.png',
      'title': 'Food Ninja is Where Your Comfort Food Lives',
      'text': 'Enjoy a fast and smooth food delivery at your doorstep'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      indexPage = index;
                    });
                  },
                  itemCount: walkthroughData.length,
                  itemBuilder: (context, index) => ContentWalkThrough(
                    title: walkthroughData[index]['title'],
                    text: walkthroughData[index]['text'],
                    image: walkthroughData[index]['image'],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        walkthroughData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    ButtonCustom(
                        title: indexPage == 1 ? 'Get Started' : 'Next',
                        onPress: () {
                          setState(() {
                            if (indexPage < 2) {
                              indexPage = indexPage + 1;
                              _pageController.animateToPage(indexPage,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            }
                            if (indexPage > 1) {
                              indexPage = 1;
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SignInScreen.routeName,
                                  (Route<dynamic> route) => false);
                            }
                          });
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: getProportionateScreenHeight(10),
      width: indexPage == index
          ? getProportionateScreenWidth(20)
          : getProportionateScreenWidth(10),
      decoration: BoxDecoration(
          color: indexPage == index ? appPrimaryColor : const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
