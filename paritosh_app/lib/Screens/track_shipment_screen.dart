import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paritosh_app/constants.dart';
import 'package:paritosh_app/widgets/drawer.dart';

import '../widgets/custom_radio_button.dart';

class TrackShipmentScreen extends StatefulWidget {
  static const String routeName = '/track-shipment';
  const TrackShipmentScreen({Key? key}) : super(key: key);

  @override
  State<TrackShipmentScreen> createState() => _TrackShipmentScreenState();
}

class _TrackShipmentScreenState extends State<TrackShipmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isAWBSelected = true;
  bool isReferenceSelected = false;
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
              color: Const.titleColor,
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
              color: Const.titleColor,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      endDrawer: const CustomDrawer(),
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Image.asset(
              "assets/images/TrackScreen.jpg",
              height: size.height * 0.285,
              width: size.width * 3.66,
            ),
          ),
        ],
      ),
    );
  }
}

//  const SizedBox(
//             height: 80,
//           ),
//           Container(
//             height: size.height * 0.7,
//             width: size.width * 0.8,
//             padding: const EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(
//                 width: 2,
//                 color: Const.primaryColor,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   'Track Your Shipment',
//                   style: GoogleFonts.k2d(
//                     textStyle: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w500,
//                       color: Const.titleColor,
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 2,
//                   color: Color.fromRGBO(30, 38, 85, 1),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomRadioButton(
//                       onTap: () {
//                         setState(() {
//                           isAWBSelected = true;
//                           isReferenceSelected = false;
//                         });
//                       },
//                       isSelected: isAWBSelected,
//                       text: 'AWb',
//                     ),
//                     SizedBox(
//                       width: size.width * 0.1,
//                     ),
//                     CustomRadioButton(
//                       onTap: () {
//                         setState(() {
//                           isReferenceSelected = true;
//                           isAWBSelected = false;
//                         });
//                       },
//                       isSelected: isReferenceSelected,
//                       text: 'Reference No',
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: size.height * 0.02,
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                           decoration: const InputDecoration(
//                             enabledBorder: OutlineInputBorder(),
//                             focusedBorder: OutlineInputBorder(),
//                             focusColor: Const.primaryColor,
//                             labelText: 'Enter Awb Number',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),