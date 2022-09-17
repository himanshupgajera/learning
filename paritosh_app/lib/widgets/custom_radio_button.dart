import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:paritosh_app/constants.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTap;
  const CustomRadioButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              border: Border.all(
                color: Const.primaryColor,
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Const.primaryColor,
                  width: 1.5,
                ),
                color: isSelected ? Const.primaryColor : Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Const.primaryColor),
          ),
        ],
      ),
    );
  }
}
