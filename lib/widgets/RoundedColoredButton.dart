import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedColoredButton extends StatelessWidget {
  double width;
  double height;
  Color textColor;
  Color fillColor;
  String text;
  double? textSize;
  VoidCallback onPressed;
  double shadowBlurRadius;


  RoundedColoredButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    this.textSize,
    required this.textColor,
    required this.fillColor,
    required this.shadowBlurRadius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: shadowBlurRadius,
          ),
        ],
      ),
      child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(
                width,
                height,
            )),
            foregroundColor: MaterialStateProperty.all(textColor),
            backgroundColor: MaterialStateProperty.all(fillColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: (textSize != null) ? textSize : 25,
                fontWeight: FontWeight.w400
            ),
          )
      ),
    );
  }
}
