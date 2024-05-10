import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/controller/getbook_bycategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  final GetBookByCategory getBookByCategory;

  const CategoryButton({
    super.key,
    required this.category,
    required this.getBookByCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(ColorName.buttonColor),
      ),
      onPressed: () {
        if (category == 'Semua') {
          getBookByCategory.showAllBooks();
        } else {
          getBookByCategory.getBooksByCategory(category);
        }
      },
      child: Text(
        category,
        style: GoogleFonts.poppins(
          color: ColorName.primary,
        ),
      ),
    );
  }
}
