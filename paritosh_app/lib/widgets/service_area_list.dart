import 'package:flutter/material.dart';

class ServiceArea {
  const ServiceArea(this.area, this.pincode);
  final String area;
  final int pincode;
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.servicearea}) : super(key: key);
  final ServiceArea servicearea;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text(servicearea.area,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: Text(servicearea.pincode.toString(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight,
                  )),
            ),
          ]),
    );
  }
}

List<ServiceArea> servicearea = const <ServiceArea>[
  ServiceArea('AMRELI', 123456),
  ServiceArea('RAJKOT', 123456),
  ServiceArea('GONDAL', 123456),
  ServiceArea('SANALI', 123456),
  ServiceArea('RANSIKI', 123456),
  ServiceArea('JALIYA', 123456),
  ServiceArea('DERADI', 123456),
  ServiceArea('MEGHPAR', 123456),
  ServiceArea('NIKOL', 123456),
  ServiceArea('MEMNAGAR', 123456),
];
