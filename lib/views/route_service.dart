import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';
import 'package:nloffice_hrm/views/custom_widgets/token_widget_item.dart';
import 'package:nloffice_hrm/views/screen/auth/forgot_password/forgot_password_screen.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_screen.dart';
import 'package:nloffice_hrm/views/screen/departmentlist_screen.dart';
import 'package:nloffice_hrm/views/screen/diplomalist_screen.dart';
import 'package:nloffice_hrm/views/screen/employeelist_screen.dart';
import 'package:nloffice_hrm/views/screen/enterpriseslist_screen.dart';
import 'package:nloffice_hrm/views/screen/home_screen.dart';
import 'package:nloffice_hrm/views/screen/language_screen.dart';
import 'package:nloffice_hrm/views/screen/menu_screen.dart';
import 'package:nloffice_hrm/views/screen/notification_screen.dart';
import 'package:nloffice_hrm/views/screen/profile_screen.dart';
import 'package:nloffice_hrm/views/screen/profilelist_screen.dart';
import 'package:nloffice_hrm/views/screen/relativelist_screen.dart';
import 'package:nloffice_hrm/views/screen/salarilist_screen.dart';
import 'package:nloffice_hrm/views/screen/sign_up_screen.dart';
import 'package:nloffice_hrm/views/screen/welcome_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: const RouteSettings(
            name: AppRoutes.homeRoute,
          ));
    ////
    case AppRoutes.welcomeRoute:
      return MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
          settings: const RouteSettings(
            name: AppRoutes.welcomeRoute,
          ));

    ///
    case AppRoutes.loginRoute:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: const RouteSettings(
            name: AppRoutes.loginRoute,
          ));

    ///
    case AppRoutes.forgotPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => const ForgePasswordScreen(),
          settings: const RouteSettings(
            name: AppRoutes.forgotPasswordRoute,
          ));

    ///
    case AppRoutes.profileRoute:
      return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: const RouteSettings(
            name: AppRoutes.profileRoute,
          ));

    ///
    case AppRoutes.signupRoute:
      return MaterialPageRoute(
          builder: (context) => const CreateAcount(),
          settings: const RouteSettings(
            name: AppRoutes.signupRoute,
          ));

    ///
    case AppRoutes.homeRoute:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: const RouteSettings(
            name: AppRoutes.homeRoute,
          ));

    ///
    case AppRoutes.noconnetionRoute:
      return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
          settings: const RouteSettings(
            name: AppRoutes.noconnetionRoute,
          ));

    ///
    case AppRoutes.employeelistRoute:
      return MaterialPageRoute(
          builder: (context) => const EmployeeListScreen(),
          settings: const RouteSettings(
            name: AppRoutes.employeelistRoute,
          ));

    ///
    case AppRoutes.languareRoute:
      return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
          settings: const RouteSettings(
            name: AppRoutes.languareRoute,
          ));

    ///
    case AppRoutes.menuRoute:
      return MaterialPageRoute(
          builder: (context) => MenuScreen(),
          settings: const RouteSettings(
            name: AppRoutes.menuRoute,
          ));

    ///
    case AppRoutes.tokenRoute:
      return MaterialPageRoute(
        builder: (context) => const MyDismissibleList(),
        settings: const RouteSettings(
          name: AppRoutes.tokenRoute,
        ),
      );

    ///
    case AppRoutes.profileListRoute:
      return MaterialPageRoute(
          builder: (context) => ProfileListScreen(),
          settings: const RouteSettings(
            name: AppRoutes.profileListRoute,
          ));

    ///
    case AppRoutes.departmentListRoute:
      return MaterialPageRoute(
          builder: (context) => DepartmentsScreen(),
          settings: const RouteSettings(
            name: AppRoutes.departmentListRoute,
          ));

    ///
    case AppRoutes.salariListRoute: // Add this case
      return MaterialPageRoute(
          builder: (context) => SalaryListScreen(),
          settings: const RouteSettings(
            name: AppRoutes.salariListRoute,
          ));

    ///
    case AppRoutes.diplomaListRoute: // Add this case
      return MaterialPageRoute(
          builder: (context) => DiplomaListScreen(),
          settings: const RouteSettings(
            name: AppRoutes.diplomaListRoute,
          ));

    ///
    case AppRoutes.relativeListRoute: // Add this case
      return MaterialPageRoute(
          builder: (context) => RelativeListScreen(),
          settings: const RouteSettings(
            name: AppRoutes.relativeListRoute,
          ));

    ///
    case AppRoutes.enterpriseListRoute: // Add this case
      return MaterialPageRoute(
          builder: (context) => EnterpriseListScreen(),
          settings: const RouteSettings(
            name: AppRoutes.enterpriseListRoute,
          ));
    default:
      return MaterialPageRoute(
          builder: ((context) => const CustomBottomNavBar()));
  }
}
