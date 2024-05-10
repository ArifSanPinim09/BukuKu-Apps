// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/color/colors.dart';

class CardWidget extends StatefulWidget {
  final String coverUrl;
  final String title;
  final VoidCallback ontap;
  const CardWidget({
    super.key,
    required this.coverUrl,
    required this.title,
    required this.ontap,
  });

  @override
  State<CardWidget> createState() => _ForyouWidgetState();
}

class _ForyouWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 168.0,
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.coverUrl),
              fit: BoxFit.cover,
            ),
            color: Colors.red,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: 112,
        ),
        const SizedBox(height: 10),
        Text(
          widget.title.length > 10
              ? '${widget.title.substring(0, 10)}...'
              : widget.title,
          style: GoogleFonts.poppins(
            color: ColorName.buttonColor,
          ),
        ),
      ],
    );
  }
}
