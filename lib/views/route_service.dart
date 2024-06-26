import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/views/custom_widgets/empty_widget.dart';
import 'package:nloffice_hrm/views/screen/home_screen.dart';
import 'package:nloffice_hrm/views/screen/menu_screen.dart';
import 'package:nloffice_hrm/views/screen/no_connection_page.dart';
import 'package:nloffice_hrm/views/screen/notification_screen.dart';
import 'package:nloffice_hrm/views/screen/profile_screen.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //
    case AppRoutes.homeRoute:
      return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: RouteSettings(
              name: AppRoutes.homeRoute,
              arguments: settings.arguments as Object));
    //
    case AppRoutes.forgotPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => EmptyWidget(), //forgotPasswordScreen()
          settings: RouteSettings(
              name: AppRoutes.forgotPasswordRoute,
              arguments: settings.arguments as Object));
    //
    case AppRoutes.profileRoute:
      return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: RouteSettings(
              name: AppRoutes.profileRoute,
              arguments: settings.arguments as Object));
    //
    case AppRoutes.notificationsRoute:
      return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
          settings: RouteSettings(
              name: AppRoutes.notificationsRoute,
              arguments: settings.arguments as Object));
    //
    case AppRoutes.noConnectionRoute:
      return MaterialPageRoute(
          builder: (context) => const NoInternetScreen(),
          settings: RouteSettings(
              name: AppRoutes.noConnectionRoute,
              arguments: settings.arguments as Object));
    //
    case AppRoutes.menuRoute:
      return MaterialPageRoute(
          builder: (context) => const MenuScreen(),
          settings: RouteSettings(
              name: AppRoutes.menuRoute,
              arguments: settings.arguments as Object));
    //
    default:
      return MaterialPageRoute(builder: ((context) => const EmptyWidget()));
  }
}
