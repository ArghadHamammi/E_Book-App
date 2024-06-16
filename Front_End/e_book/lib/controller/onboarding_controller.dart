import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class OnboardingController extends GetxController {
  next();
  onpagechane(int index);
}

class OnboardingControllerimp extends OnboardingController {
  int currentpage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage == onBoardinfList.length) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed("/login");
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechane(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
