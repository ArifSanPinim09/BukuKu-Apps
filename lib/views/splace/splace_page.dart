import 'package:book_store_apps/common/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/splash_controller.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: Center(
        child: Lottie.asset("assets/images/splash.json"),
      ),
    );
  }
}
