import 'package:flutter/material.dart';

class Network {
  const Network(this.hub, this.address, this.mail, this.name, this.mno);
  final String hub;
  final String address;
  final String mail;
  final String name;
  final int mno;
}

class NetworkList extends StatelessWidget {
  const NetworkList({Key? key, required this.network}) : super(key: key);
  final Network network;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: size.height * 0.45,
        width: size.width * 0.80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, bottom: 20.0, top: 13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.hub,
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                  child: SizedBox(
                    height: size.height * 0.035,
                    child: Text(
                      network.hub,
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.amberAccent,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                  child: SizedBox(
                    height: size.height * 0.035,
                    child: Text(
                      network.address,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                  child: SizedBox(
                    height: size.height * 0.035,
                    child: Text(
                      network.mail,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.account_box_rounded,
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                  child: SizedBox(
                    height: size.height * 0.035,
                    child: Text(
                      network.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_rounded,
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                  child: SizedBox(
                    height: size.height * 0.035,
                    child: Text(
                      network.mno.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Network> network = const <Network>[
  Network('Ahemdabad Hub', 'Nikol', 'abc@gmail.com', 'Manoj kumar', 9909155677),
  Network(
      'Surat Hub', 'Sarthana', 'def@gmail.com', 'Rajesh Movaliya', 1254355677),
  Network('Vadodara Hub', 'M.S.Univercity', 'ghi@gmail.com', 'pritesh Gajera',
      7893255677),
  Network('Rajkot Hub', 'Hemugadhvi Hall', 'jkl@gmail.com', 'Naresh Patel',
      9909486237),
  Network('Amreli Hub', 'New Bus-Stop', 'mno@gmail.com', 'Ravi Munjapara',
      9909855388),
];
