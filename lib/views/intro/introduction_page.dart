import 'package:book_store_apps/common/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../login/login_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.primary,
      ),
      body: IntroductionScreen(
        scrollPhysics: const BouncingScrollPhysics(),
        globalBackgroundColor: ColorName.primary,
        pages: [
          PageViewModel(
            title: "Selamat Datang",
            body:
                "Selamat datang di Bookworms, tempat terbaik untuk menemukan dan menjelajahi dunia buku.",
            image: Image.asset('assets/images/intro4.png'),
            decoration: PageDecoration(
              pageColor: ColorName.primary,
              titleTextStyle: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          PageViewModel(
            title: "Temukan Buku Anda",
            body:
                "Temukan berbagai macam buku terbaru, klasik, dan favorit Anda di sini.",
            image: Image.asset('assets/images/intro2.png'),
            decoration: PageDecoration(
              titleTextStyle: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          PageViewModel(
            title: "Bergabung dengan Komunitas",
            body:
                "Bergabunglah dengan komunitas pembaca kami dan nikmati manfaatnya!",
            image: Image.asset('assets/images/intro5.png'),
            decoration: PageDecoration(
              titleTextStyle: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: GoogleFonts.poppins(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        showSkipButton: true,
        skip: const Icon(Icons.arrow_left, color: ColorName.buttonColor),
        next: const Icon(Icons.arrow_right, color: ColorName.buttonColor),
        done: Text(
          "Done",
          style: GoogleFonts.poppins(
            color: ColorName.buttonColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ),
          );
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: ColorName.buttonColor,
          color: ColorName.logoColor,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
