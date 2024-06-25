import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/views/screen/profile_screen.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes:
      return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: RouteSettings(
              name: AppRoutes.profileRoute,
              arguments: settings.arguments as Object));
    default:
      return MaterialPageRoute(builder: ((context) => CustomBottomNavBar()));
  }
}
