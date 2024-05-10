import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/controller/book_create_controller.dart';
import 'package:book_store_apps/controller/google_login_controller.dart';
import 'package:book_store_apps/views/detail/detail_page.dart';
import 'package:book_store_apps/views/home/widget/card_book.dart';
import 'package:book_store_apps/views/profile/widget/row_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthController authController = AuthController();
  BookCreateController bookCreateController = BookCreateController();
  var currentUser = FirebaseAuth.instance.currentUser;
  final DateTime now = DateTime.now();
  late final String formatDate;
  // final formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(now);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formatDate = DateFormat('EEEE, MMMM d, yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 60.0),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: ColorName.buttonColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 3),
                        spreadRadius: 5,
                        blurRadius: 10.0,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              child: Image.network(
                                '${authController.auth.currentUser!.photoURL}',
                                width: 72.0,
                                height: 72.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 11.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                    border:
                                        Border.all(color: ColorName.primary),
                                  ),
                                  child: Text(
                                    "${authController.auth.currentUser?.displayName}",
                                    style: const TextStyle(
                                      color: ColorName.primary,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "admin",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorName.primary,
                                  ),
                                ),
                                Text(
                                  formatDate,
                                  style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowText(
                              icon: const Icon(Icons.edit),
                              label: 'Edit Informasi Profil',
                              value: '',
                              valueColor: ColorName.primary,
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const EditProfilePage(),
                                //   ),
                                // );
                              },
                            ),
                            const SizedBox(height: 12.0),
                            RowText(
                              icon: const Icon(Icons.notifications),
                              label: 'Notifikasi',
                              value: 'ON',
                              valueColor: ColorName.primary,
                              onTap: () {},
                            ),
                            const SizedBox(height: 12.0),
                            RowText(
                              icon: const Icon(Icons.translate),
                              label: 'Bahasa',
                              value: 'Indonesia',
                              valueColor: ColorName.primary,
                              onTap: () {},
                            ),
                            const SizedBox(height: 12.0),
                            RowText(
                              icon: const Icon(Icons.key),
                              label: 'Keamanan',
                              value: '',
                              valueColor: ColorName.primary,
                              onTap: () {},
                            ),
                            const SizedBox(height: 12.0),
                            RowText(
                              icon: const Icon(Icons.logout),
                              label: 'Keluar',
                              value: '',
                              valueColor: ColorName.primary,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Peringatan'),
                                    content:
                                        const Text('Apakah anda ingin keluar?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          const Center(
                                            child: CircularProgressIndicator(
                                              color: ColorName.primary,
                                            ),
                                          );
                                          authController.logout();
                                        },
                                        child: const Text("Ya"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Tidak"),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'Your Book',
              style: GoogleFonts.poppins(
                color: ColorName.buttonColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Book')
                  .where('user_id', isEqualTo: currentUser!.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var books = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    var book = books[index];
                    return CardBook(
                      coverUrl: book['cover_url'],
                      judul: book['judul'],
                      penulis: book['penulis'],
                      harga: '${book['price']}',
                      category: book['category'],
                      onTap: () {},
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
