import 'package:book_store_apps/common/color/colors.dart';
import 'package:flutter/material.dart';

class MultiLineTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const MultiLineTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      controller: controller,
      decoration: InputDecoration(
        fillColor: ColorName.buttonColor,
        filled: true,
        hintText: hintText,
      ),
    );
  }
}
