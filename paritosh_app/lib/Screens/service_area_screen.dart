import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paritosh_app/widgets/drawer.dart';
import 'package:paritosh_app/widgets/searchbar.dart';
import 'package:paritosh_app/widgets/service_area_list.dart';

class ServiceAreaScreen extends StatefulWidget {
  static const String routeName = '/service_area';
  const ServiceAreaScreen({Key? key}) : super(key: key);

  @override
  State<ServiceAreaScreen> createState() => _ServiceAreaScreenState();
}

class _ServiceAreaScreenState extends State<ServiceAreaScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Service Area",
          style: TextStyle(
              fontSize: 26.0, color: Theme.of(context).primaryColorDark),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              child: SvgPicture.asset(
                'assets/images/drawer.svg',
                color: Theme.of(context).primaryColorDark,
              ))
        ],
      ),
      endDrawer: const CustomDrawer(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            color: Theme.of(context).primaryColorLight,
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: const SearchBar(),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: size.height * 0.75,
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 30.0,
                right: 30.0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35.0),
                  topLeft: Radius.circular(35.0),
                ),
                color: Theme.of(context).primaryColorDark,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: size.height * 0.04,
                      width: size.width * 0.50,
                      child: const Text(
                        'Service Area',
                        style: TextStyle(
                            fontSize: 28.0,
                            color: Color.fromARGB(200, 245, 243, 99)),
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: servicearea.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SelectCard(servicearea: servicearea[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
