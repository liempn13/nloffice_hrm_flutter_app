import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MediaQuery.sizeOf(context).width <= 834
          ? BottomNavigationBar(
              // backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'more')
                ])
          : NavigationRail(
              groupAlignment: -1.0,
              labelType: NavigationRailLabelType.all,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('home'),
                    selectedIcon: Icon(Icons.home_outlined)),
                NavigationRailDestination(
                    icon: Icon(Icons.menu), label: Text('more'))
              ],
              selectedIndex: _selectIndex),
    );
  }
}
