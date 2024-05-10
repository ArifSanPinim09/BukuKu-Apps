import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/common/icons/icons.dart';
import 'package:book_store_apps/controller/book_create_controller.dart';
import 'package:book_store_apps/controller/getbook_bycategory_controller.dart';
import 'package:book_store_apps/controller/google_login_controller.dart';
import 'package:book_store_apps/model/buku_model.dart';
import 'package:book_store_apps/views/detail/detail_page.dart';
import 'package:book_store_apps/views/home/widget/card_book.dart';
import 'package:book_store_apps/views/home/widget/card_widget.dart';
import 'package:book_store_apps/views/home/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  BookCreateController bookCreateController = Get.put(BookCreateController());
  AuthController authController = Get.put(AuthController());
  final GetBookByCategory getBookByCategoryController =
      Get.put(GetBookByCategory());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      appBar: AppBar(
        backgroundColor: ColorName.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                Get.to(() => const ProfilePage());
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    '${authController.auth.currentUser?.photoURL}'),
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            const Image(
              image: IconsName.logo,
              height: 50.0,
              width: 50.0,
            ),
            const SizedBox(width: 5.0),
            Text(
              'Bookworms',
              style: GoogleFonts.poppins(
                color: ColorName.buttonColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(), // Tambahkan physics ke SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Welcome👋, ${authController.auth.currentUser?.displayName}",
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  color: ColorName.buttonColor,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: Text(
            //     "Waktunya untuk membaca buku dan meningkatkan pengetahuan Anda",
            //     style: GoogleFonts.poppins(
            //       color: ColorName.buttonColor,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Trending",
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  color: ColorName.buttonColor,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: bookCreateController.bookData
                      .map(
                        (e) => CardWidget(
                          title: e.judul!,
                          coverUrl: e.coverUrl!,
                          ontap: () {},
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            ColorName.buttonColor,
                          ),
                        ),
                        onPressed: () {
                          // When the button 'Semua' is clicked, show all books
                          getBookByCategoryController.showAllBooks();
                        },
                        child: Text(
                          'Semua',
                          style: GoogleFonts.poppins(
                            color: ColorName.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      CategoryButton(
                          category: 'Islam',
                          getBookByCategory: getBookByCategoryController),
                      const SizedBox(width: 10.0),
                      CategoryButton(
                          category: 'Filsafat',
                          getBookByCategory: getBookByCategoryController),
                      const SizedBox(width: 10.0),
                      CategoryButton(
                          category: 'Sejarah',
                          getBookByCategory: getBookByCategoryController),
                      const SizedBox(width: 10.0),
                      CategoryButton(
                          category: 'Ilmiah',
                          getBookByCategory: getBookByCategoryController),
                      const SizedBox(width: 10.0),
                      CategoryButton(
                          category: 'Politik',
                          getBookByCategory: getBookByCategoryController),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Obx(() {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: getBookByCategoryController.categories
                                .map((category) {
                              return CategoryButton(
                                category: category,
                                getBookByCategory: getBookByCategoryController,
                              );
                            }).toList(),
                          ),
                        );
                      }),
                      Obx(() {
                        if (getBookByCategoryController.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ColorName.buttonColor,
                            ),
                          );
                        } else {
                          return Column(
                            children:
                                getBookByCategoryController.books.map((e) {
                              return InkWell(
                                onTap: () => Get.to(DetailPage(bukuModel: e)),
                                hoverColor: ColorName.primary,
                                child: CardBook(
                                  judul: e.judul!,
                                  coverUrl: e.coverUrl!,
                                  category: e.category!,
                                  penulis: e.penulis!,
                                  harga: e.price!.toString(),
                                  onTap: () {},
                                ),
                              );
                            }).toList(),
                          );
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
