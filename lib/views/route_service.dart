import 'package:flutter/material.dart';
import 'package:hrm_app/constant/app_route.dart';
import 'package:hrm_app/views/widgets/bottom_nav_controller.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes:
      return MaterialPageRoute(
          builder: (context) => BottomNavController(),
          settings: RouteSettings(
              name: AppRoutes.homeRoute,
              arguments: settings.arguments as Object));
    default:
      return MaterialPageRoute(builder: ((context) => BottomNavController()));
  }
}
