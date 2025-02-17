import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  MyServices myServices = Get.find();

  List infolist = [
    // {
    //   "title": "Brands".tr,
    //   "icon": Icons.discount_rounded,
    //   "pageName": AppRoutes.editprofilepage
    // },
    {
      "title": "Brands".tr,
      "icon": Icons.wb_incandescent_rounded,
      "pageName": AppRoutes.brands
    },
    {
      "title": "refundandreturnspolicy".tr,
      "icon": Icons.settings_backup_restore,
      "pageName": AppRoutes.RefundPage
    },
    {
      "title": "quotations".tr,
      "icon": Icons.price_change,
      "pageName": AppRoutes.QuotationsPage
    },
    // {
    //   "title": "Change Password",
    //   "icon": Icons.lock,
    //   "pageName": AppRoutes.editprofilepage
    // },
    {
      "title": "achivements".tr,
      "icon": Icons.stars_outlined,
      "pageName": AppRoutes.AchivementsPage
    },
    {
      "title": "aboutus".tr,
      "icon": Icons.info,
      "pageName": AppRoutes.AboutUsPage
    },
    {
      "title": "ContactUs".tr,
      "icon": Icons.email,
      "pageName": AppRoutes.ConcetUsPage
    },
    {
      "title": "EducationalTraining".tr,
      "icon": Icons.cast_for_education_rounded,
      "pageName": AppRoutes.EducationalPage
    },
  ];

  openpage(int index) {
    String pageName = infolist[index]["pageName"];
    Get.toNamed(pageName);
  }
}
