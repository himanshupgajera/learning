import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paritosh_app/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const String routeName = '/policy';
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
          SizedBox(
            height: size.height * 0.025,
          ),
          SizedBox(
            height: size.height * 0.81,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Color.fromRGBO(241, 122, 41, 1),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'Acceptance of the Terms of Use',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(30, 38, 85, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.4,
                          width: size.width * 0.9,
                          child: Text(
                            '   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Color.fromRGBO(241, 122, 41, 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Changes to the Terms of Use',
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(30, 38, 85, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.4,
                          width: size.width * 0.9,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
//             alignment: Alignment.topCenter,
//             height: size.height * 0.13,
//             width: size.width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomRight: Radius.circular(25.0),
//                 bottomLeft: Radius.circular(25.0),
//               ),
//               color: Color.fromRGBO(30, 38, 85, 1),
//             ),
//             child: Padding(
//               padding:
//                   const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Privacy Policy",
//                     style: GoogleFonts.k2d(
//                       textStyle: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromRGBO(241, 122, 41, 1),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => scaffoldKey.currentState!.openEndDrawer(),
//                     child: SvgPicture.asset(
//                       'assets/images/drawer.svg',
//                       color: const Color.fromRGBO(241, 122, 41, 1),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),