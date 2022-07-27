import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors/colors.dart';
import 'package:food_delivery/pages/cart/cart_screen.dart';
import 'package:food_delivery/pages/chat/chat_screen.dart';
import 'package:food_delivery/pages/home/home_screen.dart';
import 'package:food_delivery/pages/profile/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  static String routeName = '/bottomnavbar';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  int badge = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),
    const ChatScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
            badge = badge + 1;
          });
        },
        controller: controller,
        itemBuilder: (context, position) {
          return screens[position];
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 22,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: GNav(
                rippleColor: appPrimaryColor.withOpacity(0.7),
                hoverColor: appPrimaryColor.withOpacity(0.8),
                haptic: true, 
                tabBorderRadius: 20,
                duration: const Duration(milliseconds: 500), 
                gap: 6,
                color: appPrimaryColor.withOpacity(0.9), 
                activeColor: Colors.white, 
                iconSize: 25, 
                tabBackgroundColor: appPrimaryColor.withOpacity(0.9),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomeScreen();
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  const GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                  ),
                  const GButton(
                    icon: Icons.shopping_cart_outlined,
                    text: 'Cart',
                  ),
                  const GButton(
                    icon: Icons.sms,
                    text: 'Chat',
                  ),
                  
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
