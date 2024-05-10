import 'package:book_store_apps/views/home/homes_bottom.dart';
import 'package:book_store_apps/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyAppClient extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    cekLogin();
  }

  void cekLogin() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (auth.currentUser != null) {
          return const MahasiswaPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
