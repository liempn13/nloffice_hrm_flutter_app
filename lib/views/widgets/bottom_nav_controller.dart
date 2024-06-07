import 'package:flutter/material.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 480
        ? BottomNavigationBar(items: <BottomNavigationBarItem>[])
        : NavigationRail(
            destinations: <NavigationRailDestination>[],
            selectedIndex: _selectIndex);
  }
}
