import 'package:book_store_apps/common/color/colors.dart';
import 'package:book_store_apps/controller/google_login_controller.dart';
import 'package:book_store_apps/views/login/widget/button_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/login1.png',
          ),
          const SizedBox(height: 20.0),
          Text(
            'Bookworms',
            style: GoogleFonts.poppins(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              'Di sini Anda dapat menemukan buku terbaik untuk Anda dan Anda juga dapat membaca buku dan mendengarkan buku',
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ButtonLogin(
          onPressed: () {
            _authController.loginGoogle();
          },
          label: "Sign in with google",
        ),
      ),
    );
  }
}
