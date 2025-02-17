import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class accountController extends GetxController {
  MyServices myServices = Get.find();

  List infolist = [
    {
      "title": "EditProfile".tr,
      "icon": Icons.person,
      "pageName": AppRoutes.editprofilepage
    },
    {
      "title": "Orders".tr,
      "icon": Icons.inbox,
      "pageName": AppRoutes.OrdersPage
    },
    {
      "title": "Favourite".tr,
      "icon": Icons.favorite,
      "pageName": AppRoutes.favouritePage
    },
    {
      "title": "points".tr,
      "icon": Icons.monetization_on,
      "pageName": AppRoutes.PointsPage
    },
    {
      "title": "Change Password".tr,
      "icon": Icons.lock,
      "pageName": AppRoutes.EditPasswordPage
    },
    {
      "title": "Language".tr,
      "icon": Icons.language,
      "pageName": AppRoutes.ChangeLangPage
    },
    // {
    //   "title": "TermsOfUse".tr,
    //   "icon": Icons.info,
    //   "pageName": AppRoutes.editprofilepage
    // },
    {
      "title": "PrivacyPolicy".tr,
      "icon": Icons.privacy_tip_outlined,
      "pageName": AppRoutes.PrivacyPolicyPage
    },
    {"title": "Logout".tr, "icon": Icons.logout, "pageName": "Logout"},
  ];

  openpage(int index) {
    if (infolist[index]["pageName"] == "Logout") {
      myServices.sharedPreferences
        ..remove("token")
        ..remove("id")
        ..remove("name")
        ..remove("email")
        ..remove("phone")
        ..remove("points");

      Get.offAllNamed(AppRoutes.mainpage);
    } else {
      String pageName = infolist[index]["pageName"];
      Get.toNamed(pageName);
    }
  }
}
