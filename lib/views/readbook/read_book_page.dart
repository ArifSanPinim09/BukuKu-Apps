// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_store_apps/controller/pdf_controller.dart';
import 'package:flutter/material.dart';

import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/model/buku_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadBookPage extends StatelessWidget {
  final BukuModel bukuModel;
  const ReadBookPage({
    super.key,
    required this.bukuModel,
  });

  @override
  Widget build(BuildContext context) {
    final PdfController pdfController = Get.put(PdfController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: ColorName.buttonColor, // Warna ikon tombol kembali
        ),
        backgroundColor: ColorName.primary,
        title: Text(
          bukuModel.judul!,
          style: GoogleFonts.poppins(
            color: ColorName.buttonColor,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SfPdfViewer.network(
        bukuModel.pdfUrl!,
        key: pdfController.pdfViewerKey,
      ),
    );
  }
}
