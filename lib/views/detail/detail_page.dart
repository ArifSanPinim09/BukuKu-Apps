import 'package:book_store_apps/controller/download_controller.dart';
import 'package:book_store_apps/controller/google_login_controller.dart';
import 'package:book_store_apps/controller/pdf_controller.dart';
import 'package:book_store_apps/views/readbook/read_book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_store_apps/model/buku_model.dart';
import 'package:book_store_apps/common/color/colors.dart';

class DetailPage extends StatefulWidget {
  final BukuModel bukuModel;
  const DetailPage({
    super.key,
    required this.bukuModel,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DownloadController downnloadControlle = Get.put(DownloadController());
  final AuthController authController = Get.put(AuthController());
  final PdfController pdfController = Get.put(PdfController());
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorName.buttonColor, // Warna ikon tombol kembali
        ),
        centerTitle: true,
        title: Text(
          widget.bukuModel.judul!,
          style: GoogleFonts.poppins(
            color: ColorName.buttonColor,
            fontSize: 18.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('${authController.auth.currentUser?.photoURL}'),
            ),
          ),
        ],
        backgroundColor: ColorName.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 264.0,
                width: 176.0,
                margin: const EdgeInsets.symmetric(vertical: 40.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.bukuModel.coverUrl!),
                  ),
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                color: ColorName.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (widget.bukuModel.judul!.length > 10)
                              ? '${widget.bukuModel.judul!.substring(0, 14)}...'
                              : widget.bukuModel.judul!,
                          style: GoogleFonts.poppins(
                            color: ColorName.buttonColor,
                            fontSize: 20.0,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                              color: ColorName.buttonColor,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                              color: ColorName.buttonColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.bukuModel.penulis!,
                      style: GoogleFonts.poppins(
                        color: ColorName.buttonColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 24.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff665230),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          widget.bukuModel.category!,
                          style: GoogleFonts.poppins(
                            color: const Color(0xffF9C975),
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Deskripsi",
                      style: GoogleFonts.poppins(
                        color: ColorName.buttonColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded
                            ? widget.bukuModel.deskripsi!
                            : '${widget.bukuModel.deskripsi!.substring(0, 150)}...Selengkapnya',
                        style: GoogleFonts.poppins(
                          color: ColorName.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Get.to(ReadBookPage(bukuModel: widget.bukuModel)),
              child: Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width / 2.5,
                padding: const EdgeInsets.symmetric(),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: ColorName.buttonColor,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye, color: ColorName.primary),
                    SizedBox(width: 5.0),
                    Center(
                      child: Text(
                        'Baca',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorName.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
