import 'package:flutter/material.dart';
import 'package:paritosh_app/Screens/network_screen.dart';
import 'package:paritosh_app/Screens/news_screen.dart';
import 'package:paritosh_app/Screens/pincode_screen.dart';
import 'package:paritosh_app/Screens/privacy_policy_screen.dart';
import 'package:paritosh_app/Screens/service_area_screen.dart';
import 'package:paritosh_app/Screens/splash_screen.dart';
import 'package:paritosh_app/Screens/weight_calculator_screen.dart';

import 'Screens/track_shipment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColorLight: const Color.fromARGB(255, 112, 195, 233),
        primaryColorDark: const Color.fromARGB(255, 26, 2, 91),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        TrackShipmentScreen.routeName: (context) =>
            const TrackShipmentScreen(),
        NetworkScreen.routeName: (context) => const NetworkScreen(),
        ServiceAreaScreen.routeName: (context) => const ServiceAreaScreen(),
        // PrivacyPolicyScreen.routeName: (context) => const PrivacyPolicyScreen(),
        NewsScreen.routeName: (context) => const NewsScreen(),
        WeightCalculatorScreen.routeName: (context) =>
            const WeightCalculatorScreen(),
        PincodeScreen.routeName: (context) => const PincodeScreen(),
      },
    );
  }
}
