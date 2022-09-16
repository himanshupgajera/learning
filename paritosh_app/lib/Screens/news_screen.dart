import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paritosh_app/Screens/track_shipment_screen.dart';
import 'package:paritosh_app/widgets/drawer.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = '/news';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  exitButtonClick() {
    Navigator.of(context)
        .pushReplacementNamed(TrackShipmentScreen.routeName);
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Latest News',
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
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: size.height * 0.87,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35.0),
                  topLeft: Radius.circular(35.0),
                ),
                color: Theme.of(context).primaryColorDark,
              ),
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: size.height * 0.25,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/latestnews.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: size.width * 0.9,
                        child: const Text(
                          "Paritosh Express provided best Service and got an award.",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 245, 245, 149),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: size.width * 0.9,
                        child: const Text(
                          "Jan 22,2022",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildNews(size),
                      const SizedBox(height: 15),
                      buildNews(size),
                      const SizedBox(height: 15),
                      buildNews(size),
                      const SizedBox(height: 15),
                      buildNews(size),
                      const SizedBox(height: 15),
                      buildNews(size),
                      const SizedBox(height: 15),
                      buildNews(size),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildNews(Size size) {
  return Container(
    height: size.height * 0.13,
    width: size.width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          height: size.height * 0.1,
          width: size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/images/news.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: size.height * 0.06,
              width: size.width * 0.58,
              child: const Text(
                "Paritosh Express provided best Service and got an award.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 1),
            SizedBox(
              height: size.height * 0.031,
              width: size.width * 0.58,
              child: const Text(
                "Jan 22,2022",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
