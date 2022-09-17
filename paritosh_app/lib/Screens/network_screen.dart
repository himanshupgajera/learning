import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paritosh_app/widgets/drawer.dart';

import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class NetworkScreen extends StatefulWidget {
  static const String routeName = '/network';
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: size.height * 0.13,
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
              color: Color.fromRGBO(30, 38, 85, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "Privacy Policy",
                    style: GoogleFonts.k2d(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Const.titleColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: TextButton(
                    onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                    child: SvgPicture.asset(
                      'assets/images/drawer.svg',
                      color: Const.titleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //     key: scaffoldKey,
    //     resizeToAvoidBottomInset: false,
    //     appBar: AppBar(
    //       title: Text(
    //         "Network",
    //         style: TextStyle(
    //             fontSize: 26.0, color: Theme.of(context).primaryColorDark),
    //       ),
    //       backgroundColor: Theme.of(context).primaryColorLight,
    //       elevation: 0,
    //       actions: [
    //         TextButton(
    //           onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
    //           child: SvgPicture.asset(
    //             'assets/images/drawer.svg',
    //             color: Theme.of(context).primaryColorDark,
    //           ),
    //         ),
    //       ],
    //     ),
    //     endDrawer: const CustomDrawer(),
    //     body: Stack(
    //       children: [
    //         Container(
    //           height: size.height,
    //           color: Theme.of(context).primaryColorLight,
    //           padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
    //           child: const SearchBar(),
    //         ),
    //         Positioned(
    //           bottom: 0.0,
    //           left: 0.0,
    //           right: 0.0,
    //           child: Container(
    //             height: size.height * 0.75,
    //             padding: const EdgeInsets.only(
    //               top: 30.0,
    //               left: 30.0,
    //               right: 30.0,
    //             ),
    //             decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.only(
    //                 topRight: Radius.circular(35.0),
    //                 topLeft: Radius.circular(35.0),
    //               ),
    //               color: Theme.of(context).primaryColorDark,
    //             ),
    //             child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(
    //                       height: size.height * 0.04,
    //                       width: size.width * 0.50,
    //                       child: const Text(
    //                         'Network',
    //                         style: TextStyle(
    //                             fontSize: 28.0,
    //                             color: Color.fromARGB(200, 245, 243, 99)),
    //                       )),
    //                   SizedBox(
    //                     height: size.height * 0.02,
    //                   ),
    //                   Expanded(
    //                     child: ListView.builder(
    //                       itemCount: network.length,
    //                       itemBuilder: (ctx, index) {
    //                         return Padding(
    //                           padding: const EdgeInsets.only(top: 20.0),
    //                           child: NetworkList(network: network[index]),
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                 ]),
    //           ),
    //         ),
    //       ],
    //     ));
  }
}
