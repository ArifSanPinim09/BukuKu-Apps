import 'package:book_store_apps/common/color/colors.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final TextEditingController controller;
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        fillColor: ColorName.buttonColor,
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: ColorName.primary,
        ),
      ),
    );
  }
}
