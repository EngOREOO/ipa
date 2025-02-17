import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.mainpage);
    }
    // if (myServices.sharedPreferences.getString("step") == "1") {
    //   return RouteSettings(name: AppRoutes.authpage);
    // }
  }
}
