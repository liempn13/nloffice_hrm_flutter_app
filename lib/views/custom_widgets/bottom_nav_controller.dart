import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_route.dart';

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
          ? BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 6.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.homeRoute);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushNamed(AppRoutes.scanenQRCodeRoute);
                    },
                  ),
                  SizedBox(width: 40), // The dummy child
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.tokenRoute);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.menu_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            )
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
