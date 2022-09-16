import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paritosh_app/Screens/track_shipment_screen.dart';
import 'package:paritosh_app/widgets/drawer.dart';
import 'package:paritosh_app/widgets/weight_calculator_container.dart';

class WeightCalculatorScreen extends StatefulWidget {
  static const String routeName = '/weight-calculator';
  const WeightCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<WeightCalculatorScreen> createState() => _WeightCalculatorScreenState();
}

class _WeightCalculatorScreenState extends State<WeightCalculatorScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  MeasurementType measurementType = MeasurementType.centimeter;
  ModeType mode = ModeType.air;

  double volumetricWeight = 0.0;
  double height = 0.0;
  double width = 0.0;
  double length = 0.0;
  bool isAirRadioSelect = true;
  bool isSurfaceRadioSelect = false;
  bool isCm = true;
  bool isInches = false;

  exitButtonClick() {
    Navigator.of(context).pushReplacementNamed(TrackShipmentScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Weight Calculator',
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
            ),
          ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: size.height * 0.04,
                      width: size.width * 0.80,
                      child: const Text(
                        'Unit of Measurement',
                        style: TextStyle(
                            fontSize: 28.0,
                            color: Color.fromARGB(200, 245, 243, 99)),
                      )),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  buildAirSurfaceSelection(size),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  buildSwitchContainer(size, context),
                  SizedBox(height: size.height * 0.06),
                  buildHeightWidthLengthContainer(size),
                  SizedBox(height: size.height * 0.04),
                  SizedBox(
                    height: size.height * 0.04,
                    width: size.width * 0.8,
                    child: const Text(
                      'Volumetric Weight',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(200, 245, 243, 99),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  WeightCalculatorContainer(
                      size: size, volumetricWeight: volumetricWeight),
                  SizedBox(height: size.height * 0.015),
                  SizedBox(
                    height: size.height * 0.035,
                    width: size.width * 0.8,
                    child: const Text(
                      'Kilogram',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(200, 245, 243, 99),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                debugPrint('Track Here');
                calculateVolumetricWeight();
                _heightController.clear();
                _lengthController.clear();
                _widthController.clear();
              },
              child: Container(
                height: size.height * 0.08,
                width: size.width * 0.96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.yellow,
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  height: size.height * 0.035,
                  width: size.width * 0.8,
                  child: Text(
                    'Calculate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void calculateVolumetricWeight() {
    if (mode == ModeType.air) {
      if (measurementType == MeasurementType.centimeter) {
        var weight = (height * width * length) / 5000;
        setState(() {
          volumetricWeight = weight;
        });
      }
      if (measurementType == MeasurementType.inches) {
        var weight = ((height * width * length) * 2.54) / 5000;
        setState(() {
          volumetricWeight = weight;
        });
      }
    } else if (mode == ModeType.surface) {
      if (measurementType == MeasurementType.centimeter) {
        var weight = (height * width * length) / 6000;
        setState(() {
          volumetricWeight = weight;
        });
      }
      if (measurementType == MeasurementType.inches) {
        var weight = ((height * width * length) * 2.54) / 6000;
        setState(() {
          volumetricWeight = weight;
        });
      }
    }
  }

  Widget buildAirSurfaceSelection(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSurfaceRadioSelect = !isSurfaceRadioSelect;
                  isAirRadioSelect = !isAirRadioSelect;
                  mode = ModeType.air;
                });
              },
              child: Container(
                height: size.height * 0.04,
                width: size.width * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle),
                child: isAirRadioSelect
                    ? Container(
                        height: size.height * 0.025,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColorDark),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      )
                    : Container(),
              ),
            ),
            SizedBox(width: size.width * 0.03),
            const Text(
              'Air',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSurfaceRadioSelect = !isSurfaceRadioSelect;
                  isAirRadioSelect = !isAirRadioSelect;
                  mode = ModeType.surface;
                });
              },
              child: Container(
                height: size.height * 0.04,
                width: size.width * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle),
                child: isSurfaceRadioSelect
                    ? Container(
                        height: size.height * 0.025,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColorDark),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      )
                    : Container(),
              ),
            ),
            SizedBox(width: size.width * 0.03),
            const Text(
              'Surface',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSwitchContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isCm = !isCm;
                isInches = !isInches;
                measurementType = MeasurementType.centimeter;
                volumetricWeight = 0.0;
              });
            },
            child: Container(
              height: size.height * 0.06,
              width: isCm ? size.width * 0.45 : size.width * 0.404,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: isCm
                    ? Theme.of(context).primaryColorLight
                    : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.035,
                width: size.width * 0.3,
                child: Text(
                  'Centimeter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isCm
                        ? Theme.of(context).primaryColorDark
                        : Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCm = !isCm;
                isInches = !isInches;
                measurementType = MeasurementType.inches;
                volumetricWeight = 0.0;
              });
            },
            child: Container(
              height: size.height * 0.06,
              width: isInches ? size.width * 0.45 : size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: isInches
                    ? Theme.of(context).primaryColorLight
                    : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height * 0.035,
                width: size.width * 0.3,
                child: Text(
                  'Inches',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isInches
                        ? Theme.of(context).primaryColorDark
                        : Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeightWidthLengthContainer(Size size) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 0.26,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
              alignment: Alignment.center,
              child: TextFormField(
                controller: _lengthController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '00.00',
                    hintStyle: TextStyle(fontSize: 28)),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: false,
                  selectAll: false,
                ),
                textAlign: TextAlign.center,
                cursorHeight: 30.0,
                cursorColor: Theme.of(context).primaryColorDark,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  setState(() {
                    val.isEmpty ? length = length : length = double.parse(val);
                    if (volumetricWeight != 0.0) {
                      volumetricWeight = 0.0;
                    }
                  });
                },
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.035,
              width: size.width * 0.2,
              child: const Text(
                'Length',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: size.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 0.26,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(10.0)),
              padding:
                  const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
              alignment: Alignment.center,
              child: TextFormField(
                controller: _widthController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '00.00',
                    hintStyle: TextStyle(fontSize: 28)),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: false,
                  selectAll: false,
                ),
                textAlign: TextAlign.center,
                cursorHeight: 30.0,
                cursorColor: Theme.of(context).primaryColorDark,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  setState(() {
                    val.isEmpty ? width = width : width = double.parse(val);
                    if (volumetricWeight != 0.0) {
                      volumetricWeight = 0.0;
                    }
                  });
                },
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.035,
              width: size.width * 0.2,
              child: const Text(
                'Width',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: size.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 0.26,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(10.0)),
              padding:
                  const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
              alignment: Alignment.center,
              child: TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '00.00',
                    hintStyle: TextStyle(fontSize: 28)),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: false,
                  selectAll: false,
                ),
                textAlign: TextAlign.center,
                cursorHeight: 30.0,
                cursorColor: Theme.of(context).primaryColorDark,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  setState(() {
                    val.isEmpty ? height = height : height = double.parse(val);
                    if (volumetricWeight != 0.0) {
                      volumetricWeight = 0.0;
                    }
                  });
                },
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.035,
              width: size.width * 0.2,
              child: const Text(
                'Height',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

enum ModeType { air, surface }

enum MeasurementType { centimeter, inches }
