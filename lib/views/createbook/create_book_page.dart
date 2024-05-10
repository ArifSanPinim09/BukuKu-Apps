import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/controller/book_create_controller.dart';
import 'package:book_store_apps/controller/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/widget/multi_line_textfield.dart';
import '../../common/widget/textformfield.dart';

class AddNewBookPage extends StatefulWidget {
  const AddNewBookPage({super.key});

  @override
  State<AddNewBookPage> createState() => _AddNewBookPageState();
}

class _AddNewBookPageState extends State<AddNewBookPage> {
  String selectedValue = "Komik";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Novel ", child: Text("Novel ")),
      const DropdownMenuItem(value: "Komik", child: Text("Komik")),
      const DropdownMenuItem(value: "Dongeng", child: Text("Dongeng")),
      const DropdownMenuItem(value: "Biografi", child: Text("Biografi")),
      const DropdownMenuItem(
          value: "Karya Ilmiah", child: Text("Karya Ilmiah")),
      const DropdownMenuItem(value: "BiograTafsirfi", child: Text("Tafsir")),
      const DropdownMenuItem(value: "Majalah", child: Text("Majalah")),
      const DropdownMenuItem(value: "Atlas", child: Text("Atlas")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    PdfController pdfController = Get.put(PdfController());
    BookCreateController bookCreateController = Get.put(BookCreateController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.primary,
        elevation: 0,
        title: Text(
          'Upload Buku',
          style: GoogleFonts.poppins(
            color: ColorName.buttonColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: ColorName.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: ColorName.primary),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      InkWell(
                          onTap: () {
                            bookCreateController.pickImage();
                          },
                          child: Obx(
                            () => Container(
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorName.buttonColor,
                              ),
                              child: Center(
                                child: bookCreateController
                                        .isImageUploading.value
                                    ? const CircularProgressIndicator(
                                        color: ColorName.primary,
                                      )
                                    : bookCreateController.imageUrl.value == ""
                                        ? const Icon(Icons.add_a_photo)
                                        : Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              bookCreateController
                                                  .imageUrl.value,
                                            ),
                                          ),
                              ),
                            ),
                          )),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: bookCreateController.pdfUrl.value == ""
                                ? ColorName.buttonColor
                                : ColorName.textColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: bookCreateController.isPdfUploading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorName.primary,
                                  ),
                                )
                              : bookCreateController.pdfUrl.value == ""
                                  ? InkWell(
                                      onTap: () {
                                        bookCreateController.pickPDF();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.picture_as_pdf),
                                          const SizedBox(width: 8),
                                          Text(
                                            "Book PDF",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: ColorName.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        bookCreateController.pdfUrl.value = "";
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.delete),
                                          const SizedBox(width: 8),
                                          Text(
                                            "Delete Pdf",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Judul",
                  icon: Icons.book,
                  controller: bookCreateController.judul,
                ),
                const SizedBox(height: 10),
                MultiLineTextField(
                    hintText: "Deskripsi",
                    controller: bookCreateController.deskripsi),
                const SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Penulis",
                  icon: Icons.person,
                  controller: bookCreateController.penulis,
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Penerbit",
                  icon: Icons.person,
                  controller: bookCreateController.penerbit,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Format",
                        icon: Icons.format_align_justify,
                        controller: bookCreateController.format,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Category",
                        icon: Icons.category,
                        controller: bookCreateController.category,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        isNumber: true,
                        hintText: "Harga",
                        icon: Icons.currency_bitcoin,
                        controller: bookCreateController.price,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Halaman",
                        isNumber: true,
                        icon: Icons.book,
                        controller: bookCreateController.halaman,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Language",
                        icon: Icons.language,
                        controller: bookCreateController.bahasa,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextFormField(
                        hintText: "Peringkat",
                        icon: Icons.star,
                        controller: bookCreateController.rating,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Colors.red,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "CANCLE",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Obx(
                      () => Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorName.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: bookCreateController.isPdfUploading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : InkWell(
                                onTap: () {
                                  bookCreateController.createBook();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.upload_sharp,
                                      color: ColorName.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "POST",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: ColorName.primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    )),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
