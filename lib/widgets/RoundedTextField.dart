import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  String hintText;
  double hintTextSize;
  Color borderColor;
  Color selectedBorderColor;
  Icon? trailingIcon;
  RoundedTextField({
    Key? key,
    required this.hintText,
    required this.hintTextSize,
    required this.borderColor,
    required this.selectedBorderColor,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: hintTextSize,
            color: const Color(0xff9BAEBC),
          ),
          filled: false,
          contentPadding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                width: 1,
                color: borderColor
            ),
          ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: selectedBorderColor),
        ),
          suffixIcon: trailingIcon,
      ),
    );
  }
}
