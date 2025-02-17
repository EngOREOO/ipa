import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/localization/changelocal.dart';
import 'package:elmahdy/view/widget/buttonlangwidget.dart';

class ChangeLangPage extends GetView<localeController> {
  const ChangeLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language".tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonLangWidget(
              image: AppImageAssets.egypt,
              name: "العربية",
              ontap: () {
                controller.changeLang("ar");
                Get.offAllNamed(AppRoutes.mainpage);
              },
            ),
            SizedBox(height: 50),
            ButtonLangWidget(
              image: AppImageAssets.england,
              name: "English",
              ontap: () {
                controller.changeLang("en");
                Get.offAllNamed(AppRoutes.mainpage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
