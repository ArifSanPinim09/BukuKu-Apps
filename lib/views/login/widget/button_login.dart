// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/color/colors.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    //buatkan saya button login yang ada logo nya
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorName.buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/google.png",
              width: 20.0,
              height: 20.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: ColorName.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
