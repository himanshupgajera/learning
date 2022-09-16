import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paritosh_app/widgets/drawer.dart';

class TrackShipmentScreen extends StatelessWidget {
  static const String routeName = '/track-shipment';
  const TrackShipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Track your Shipment',
          style: GoogleFonts.k2d(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(241, 122, 41, 1),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(17),
            bottomLeft: Radius.circular(17),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
            child: SvgPicture.asset(
              'assets/images/drawer.svg',
              color: const Color.fromRGBO(241, 122, 41, 1),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
            height: size.height * 0.4,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(30, 38, 85, 1),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Track Your Shipment',
                  style: GoogleFonts.k2d(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(241, 122, 41, 1),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Color.fromRGBO(30, 38, 85, 1),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            "assets/images/TrackScreen.jpg",
            height: size.height * 0.285,
            width: size.width * 3.66,
          ),
        ],
      ),
    );
  }
}
