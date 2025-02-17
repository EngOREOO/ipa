import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/static.dart';

class OnBordingController extends GetxController {
  int crrentpage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  next() {
    crrentpage++;
    if (crrentpage > onbordinglist.length - 1) {
      myServices.sharedPreferences.setString("step", "2");
      Get.offAllNamed(AppRoutes.mainpage);
    } else {
      pageController.animateToPage(crrentpage,
          duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  onpagechanged(int index) {
    crrentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
