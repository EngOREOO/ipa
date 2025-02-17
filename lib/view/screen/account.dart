import 'package:elmahdy/controller/account_controller.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/widget/buttonaccountwidget.dart';
import 'package:elmahdy/view/widget/sectiontitleaccountwidget.dart';
import 'package:elmahdy/view/widget/topbaraccountwidget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    accountController controller = Get.put(accountController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.buttononbording,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      //  backgroundColor: AppColor.buttononbording,
      body: Container(
        child: ListView(
          shrinkWrap: false,
          children: [
            Container(
              color: AppColor.buttononbording,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        MyServices myServices = Get.find();
                        myServices.sharedPreferences.getString("token") == null
                            ? Get.toNamed(AppRoutes.login)
                            : null;
                      },
                      child: TopBarAccountWidget()),
                  Container(
                    padding: EdgeInsets.only(top: 25, right: 20, left: 20),
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitleAccountWidget(
                          top: 0,
                          title: "General".tr,
                        ),
                        ...List.generate(
                            controller.infolist.length,
                            (index) => InkWell(
                                  onTap: () {
                                    controller.openpage(index);
                                  },
                                  child: ButtonAccountWidget(
                                    text: controller.infolist[index]["title"],
                                    icon: controller.infolist[index]["icon"],
                                  ),
                                ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
