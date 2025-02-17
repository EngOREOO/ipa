import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/localization/changelocal.dart';
import 'package:elmahdy/view/widget/buttonlangwidget.dart';

class LanguagePage extends GetView<localeController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonLangWidget(
              image: AppImageAssets.egypt,
              name: "العربية",
              ontap: () {
                // Get.snackbar("اشعار", "غير جاهز");
                controller.changeLang("ar");
                myServices.sharedPreferences.setString("step", "2");

                Get.toNamed(AppRoutes.mainpage);
              },
            ),
            SizedBox(height: 50),
            ButtonLangWidget(
              image: AppImageAssets.england,
              name: "English",
              ontap: () {
                controller.changeLang("en");
                myServices.sharedPreferences.setString("step", "2");

                Get.toNamed(AppRoutes.mainpage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
