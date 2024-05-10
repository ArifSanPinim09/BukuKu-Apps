import 'package:book_store_apps/views/home/homes_bottom.dart';
import 'package:book_store_apps/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splaceController();
  }

  void splaceController() {
    Future.delayed(const Duration(seconds: 3), () {
      if (auth.currentUser != null) {
        Get.offAll(const MahasiswaPage());
      } else {
        Get.offAll(const LoginPage());
      }
    });
  }
}
