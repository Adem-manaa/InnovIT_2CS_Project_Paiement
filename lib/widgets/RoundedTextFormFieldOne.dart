import 'package:flutter/material.dart';
class RoundedTextFormFieldOne extends StatelessWidget {
  String hintText;
  double hintTextSize;
  Color borderColor;
  Color selectedBorderColor;
  Icon? trailingIcon;
  Icon? prefixIcon;
  double? borderRadius;
  bool? hideText;
  TextEditingController? controller;
  FormFieldValidator? validator;
  FormFieldSetter<String?>? onSaved;
  RoundedTextFormFieldOne({
    Key? key,

    required this.hintText,
    required this.hintTextSize,
    required this.borderColor,
    required this.selectedBorderColor,
    this.hideText,
    this.trailingIcon,
    this.prefixIcon,
    this.borderRadius,
    this.controller,
    this.validator,
    this.onSaved
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (hideText == null)? false : hideText!,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintTextSize,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w700,


        ),

        filled: false,

        contentPadding:  const EdgeInsets.only(  top: 5, bottom: 5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((borderRadius != null) ? borderRadius! : 20),
          borderSide: BorderSide(
              width: 1,
              color: borderColor
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: selectedBorderColor),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: trailingIcon,
      ),
      textAlign: TextAlign.center,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
