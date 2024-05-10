// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/common/utils/format_price.dart';
import 'package:book_store_apps/controller/book_create_controller.dart';

class CardBook extends StatefulWidget {
  final String coverUrl;
  final String judul;
  final String penulis;
  final String harga;
  final String category;
  final VoidCallback onTap;

  const CardBook({
    super.key,
    required this.coverUrl,
    required this.judul,
    required this.penulis,
    required this.harga,
    required this.category,
    required this.onTap,
  });

  @override
  State<CardBook> createState() => _CardBookState();
}

class _CardBookState extends State<CardBook> {
  BookCreateController bookCreateController = Get.put(BookCreateController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: ColorName.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 20,
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 168.0,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.coverUrl),
                  ),
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                width: 112,
              ),
              const SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.judul.length > 10
                          ? '${widget.judul.substring(0, 13)}${widget.judul.length > 13 ? '...' : ''}'
                          : widget.judul,
                      style: GoogleFonts.poppins(
                        color: ColorName.buttonColor,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      widget.penulis.length > 10
                          ? '${widget.penulis.substring(0, 10)}...'
                          : widget.penulis,
                      style: GoogleFonts.poppins(
                        color: ColorName.buttonColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.harga.formatPrice(),
                      style: GoogleFonts.poppins(
                        fontSize: 15.0,
                        color: ColorName.buttonColor,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 120.0,
                          height: 35.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xff665230),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              widget.category,
                              style: GoogleFonts.poppins(
                                color: const Color(0xffF9C975),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
