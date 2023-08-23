// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_app/core/values/app_colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Function(String) onChanged;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 3,
                spreadRadius: 0,
                color: blackColor.withOpacity(0.15))
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
