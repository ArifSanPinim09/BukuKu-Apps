import 'package:book_store_apps/common/message/message.dart';
import 'package:book_store_apps/views/home/homes_bottom.dart';
import 'package:book_store_apps/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void loginGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? gooleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await gooleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      Get.offAll(() => const MahasiswaPage());
      successMessage("Login Berhasil");
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
      errorMessage("Login Gagal");
    }
    isLoading.value = false;
  }

  void logout() async {
    await auth.signOut();
    Get.offAll(const LoginPage());
  }
}
