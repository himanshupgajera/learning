import 'package:flutter/material.dart';

class WeightCalculatorContainer extends StatelessWidget {
  const WeightCalculatorContainer(
      {Key? key, required this.size, required this.volumetricWeight})
      : super(key: key);

  final double volumetricWeight;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        alignment: Alignment.center,
        child: SizedBox(
          height: size.height * 0.09,
          width: size.width * 0.8,
          child: Text(
            volumetricWeight.toStringAsFixed(2),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
                fontSize: 65.0,
                letterSpacing: 0.5),
          ),
        ),
      ),
    );
  }
}
