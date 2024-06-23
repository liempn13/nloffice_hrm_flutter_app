import 'dart:async';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nloffice_hrm/constant/app_languages.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/constant/app_theme.dart';
import 'package:nloffice_hrm/constant/internet_connect.dart';
import 'package:nloffice_hrm/services/notification.service.dart';
import 'package:nloffice_hrm/views/screen/home_screen.dart';
import 'package:nloffice_hrm/views/screen/profile_screen.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';
import 'package:nloffice_hrm/views/custom_widgets/chip_textfield_list.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:nloffice_hrm/views/route_service.dart' as router;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//ssll handshake error
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // await connectSQL();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await translator.init(
        assetsDirectory: 'assets/lang',
        languagesList: AppLanguages.codes,
        localeType: LocalizationDefaultType.asDefined);
    await NotificationService.clearIrrelevantNotificationChannels();
    await NotificationService.initializeAwesomeNotification();
    await NotificationService.listenToActions();
    //prevent ssl error
    HttpOverrides.global = new MyHttpOverrides();
    // Run app!
    runApp(LocalizedApp(child: MainApp()));
  }, (error, stack) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme().lightTheme(),
      dark: AppTheme().darkTheme(),
      initial: AdaptiveThemeMode.system, // đồng bộ với chế độ màu nền thiết bị
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: 'NLOffice',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: translator.delegates,
          locale: translator.activeLocale,
          supportedLocales: translator.locals(),
          onGenerateRoute: router.generateRoute,
          onUnknownRoute: (RouteSettings settings) {
            // open your app when is executed from outside when is terminated.
            return router.generateRoute(settings);
          },
          home: ProfileScreen(),
          theme: theme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}

Future<void> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    final result =
        '${iosDeviceInfo.name}-${iosDeviceInfo.model}-${iosDeviceInfo.identifierForVendor}';
    // SPUtill.setValue(SPUtill.keyIosDeviceToken, result);
    // return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    final result =
        '${androidDeviceInfo.brand}-${androidDeviceInfo.device}-${androidDeviceInfo.id}';
    // SPUtill.setValue(SPUtill.keyAndroidDeviceToken, result);
    // final map = androidDeviceInfo.toMap();
    // print('Device Map: $map');
    // return androidDeviceInfo.androidId; // unique ID on Android
  }
}
