import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/constant/app_theme.dart';
import 'package:nloffice_hrm/constant/internet_connect.dart';
import 'package:nloffice_hrm/views/screen/home_screen.dart';
import 'package:nloffice_hrm/views/screen/profile_screen.dart';
import 'package:nloffice_hrm/views/widgets/bottom_nav_controller.dart';
import 'package:nloffice_hrm/views/widgets/chip_textfield_list.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:nloffice_hrm/views/route_service.dart' as router;

void main() async {
  // await connectSQL();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme().lightTheme(),
      dark: AppTheme().darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: 'NLOffice',
          debugShowCheckedModeBanner: false,
          // localizationsDelegates: translator.delegates,
          // locale: translator.activeLocale,
          // supportedLocales: translator.locals(),
          theme: theme,
          darkTheme: darkTheme,
          home: ProfileScreen(),
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}
