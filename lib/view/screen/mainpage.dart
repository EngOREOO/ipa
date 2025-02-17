import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/mainpage_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/widget/appbarhomewidget.dart';
import 'package:elmahdy/view/widget/buttonbottomappbarwidget.dart';
import 'package:elmahdy/view/widget/sidebarhomewidget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    Get.put(MainPageController());

    return GetBuilder<MainPageController>(
      builder: (controller) => Scaffold(
        drawer: const Drawer(child: SideBarWidget()),
        key: controller.scafoldkey,
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BottomAppBar(
                color: AppColor.buttononbording,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    controller.listPage.length,
                    (index) {
                      bool isCenterButton = index == 2;
                      return ButtonBottomAppbarWidget(
                        sizeicon: isCenterButton ? 30 : 20,
                        padding: isCenterButton ? 10 : 2,
                        text: isCenterButton
                            ? null
                            : controller.namescreen[index]["title"],
                        icon: controller.namescreen[index]["icon"],
                        onPressed: () {
                          index == 1
                              ? Get.toNamed(AppRoutes.productspage)
                              : index == 3
                                  ? myServices.sharedPreferences
                                              .getString("token") ==
                                          null
                                      ? Get.toNamed(AppRoutes.login)
                                      : Get.toNamed(AppRoutes.cart)
                                  : index == 4
                                      ? myServices.sharedPreferences
                                                  .getString("token") ==
                                              null
                                          ? Get.toNamed(AppRoutes.login)
                                          : controller.changePage(index)
                                      : controller.changePage(index);
                        },
                        active: isCenterButton
                            ? false
                            : controller.currentpage == index,
                        center:
                            isCenterButton ? Colors.blue : Colors.transparent,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
