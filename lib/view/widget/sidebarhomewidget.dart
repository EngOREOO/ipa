import 'package:elmahdy/controller/sidebar_controller.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/widget/sidebarhomebuttonswidget.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController controller = Get.put(SideBarController());
    MyServices myServices = Get.find();

    return Column(
      children: [
        InkWell(
          onTap: () {
            MyServices myServices = Get.find();
            myServices.sharedPreferences.getString("token") == null
                ? Get.toNamed(AppRoutes.login)
                : null;
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.buttononbording,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    width: 90,
                    height: 90,
                    color: AppColor.white,
                    child: Image.asset(AppImageAssets.person),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  myServices.sharedPreferences.getString("name") != null
                      ? "${myServices.sharedPreferences.getString("name")}"
                      : "login".tr,
                  style: TextStyle(color: AppColor.white, fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                controller.infolist.length,
                (index) => SideHomeButtonWidget(
                  onTap: () {
                    controller.openpage(index);
                  },
                  text: controller.infolist[index]["title"],
                  icon: controller.infolist[index]["icon"],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
