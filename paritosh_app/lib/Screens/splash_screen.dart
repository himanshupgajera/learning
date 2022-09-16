import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paritosh_app/Screens/track_shipment_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
    if (mounted) setState(() {});
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => navigateUser());
  }

  navigateUser() {
    Navigator.of(context)
        .pushReplacementNamed(TrackShipmentScreen.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: Image(
                image: AssetImage(
                    "assets/images/paritosh-express-final-logo-done-change 1.png"),
                height: 200.0,
                width: 250.0,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
