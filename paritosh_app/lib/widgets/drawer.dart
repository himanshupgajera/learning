import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paritosh_app/Screens/network_screen.dart';
import 'package:paritosh_app/Screens/news_screen.dart';
import 'package:paritosh_app/Screens/pincode_screen.dart';
import 'package:paritosh_app/Screens/privacy_policy_screen.dart';
import 'package:paritosh_app/Screens/service_area_screen.dart';
import 'package:paritosh_app/Screens/weight_calculator_screen.dart';
import 'package:paritosh_app/Screens/track_shipment_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      elevation: 20.0,
      backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: size.height * 0.13,
                width: size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/facebook.svg",
                      height: 30,
                      width: 30,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    const SizedBox(width: 30),
                    SvgPicture.asset(
                      "assets/images/twitter.svg",
                      height: 30,
                      width: 30,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    const SizedBox(width: 30),
                    SvgPicture.asset(
                      "assets/images/instagram.svg",
                      height: 30,
                      width: 30,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.85,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    height: size.height * 0.25,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                        image: AssetImage(
                            "assets/images/paritosh-express-final-logo-done-change 1.png"),
                        fit: BoxFit.fill),
                  ),
                  ListTile(
                    leading: Icon(Icons.my_location_outlined,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("Tracking",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(TrackShipmentScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                  ListTile(
                    leading: Icon(Icons.sensors,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("Network",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(NetworkScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                  ListTile(
                    leading: Icon(Icons.assured_workload_outlined,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("Service Area",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(ServiceAreaScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on_rounded,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("Pincode",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(PincodeScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                  ListTile(
                    leading: Icon(Icons.monitor_weight_outlined,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("Weight Calculator",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(WeightCalculatorScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                  ListTile(
                    leading: Icon(Icons.newspaper_outlined,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("News",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(NewsScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip_rounded,
                        color: Theme.of(context).primaryColorDark),
                    title: const Text("Privacy Policy",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(PrivacyPolicyScreen.routeName),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
