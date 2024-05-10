// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:book_store_apps/controller/google_login_controller.dart';
import 'package:book_store_apps/controller/search_controller.dart';
import 'package:book_store_apps/model/buku_model.dart';
import 'package:book_store_apps/views/detail/detail_page.dart';
import 'package:book_store_apps/views/home/widget/card_book.dart';

import '../../common/color/colors.dart';
import '../../common/icons/icons.dart';
import '../profile/profile_page.dart';

class SearchPage extends StatefulWidget {
  final BukuModel? bukuModel;
  const SearchPage({
    super.key,
    this.bukuModel,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchControllers _controller = Get.put(SearchControllers());
  final AuthController authController = Get.put(AuthController());

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
                  '${authController.auth.currentUser?.photoURL}',
                ),
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
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: ColorName.buttonColor,
              ),
              child: TextField(
                style: GoogleFonts.poppins(
                  color: ColorName.textColor,
                ),
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: ColorName.textColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                  hintText: 'Cari buku....',
                ),
                onChanged: (query) {
                  _controller.search(query);
                },
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.searchResults.length,
                itemBuilder: (context, index) {
                  final BukuModel searchResult =
                      _controller.searchResults[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      onTap: () => Get.to(
                        DetailPage(bukuModel: searchResult),
                      ),
                      child: CardBook(
                        coverUrl: searchResult.coverUrl ?? '-',
                        judul: searchResult.judul ?? '-',
                        penulis: searchResult.penulis ?? '-',
                        harga: searchResult.price.toString(),
                        category: searchResult.category ?? '-',
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
