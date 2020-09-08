import 'package:flutter/material.dart';
import 'package:blastFutureFlutter/screens/first_screen.dart';
import 'package:blastFutureFlutter/screens/geolocator_screen.dart';
import 'package:blastFutureFlutter/screens/layout_screen.dart';
import 'package:blastFutureFlutter/screens/map_screen.dart';
import 'package:blastFutureFlutter/screens/device_info_screen.dart';
import 'package:blastFutureFlutter/screens/package_info_screen.dart';
import 'package:blastFutureFlutter/screens/bottom_sheet_screen.dart';
import 'package:blastFutureFlutter/screens/test_alert_dialog_screen.dart';
import 'package:blastFutureFlutter/screens/smrt/smrt_start_screen.dart';
import 'package:blastFutureFlutter/screens/smrt/smrt_setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zest Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/geolocator': (context) => GeolocatorScreen(),
        '/layout': (context) => LayoutScreen(),
        '/map': (context) => MapScreen(),
        '/deviceInfo': (context) => DeviceInfoScreen(),
        '/packageInfo': (context) => PackageInfoScreen(),
        '/bottomSheet': (context) => BottomSheetScreen(),
        '/testAlertDialog': (context) => TestAlertDialogScreen(),
        '/smrtStartScreen': (context) => SmrtStartScreen(),
        '/smrtSettingScreen': (context) => SmrtSettingScreen(),
      },
    );
  }
}
