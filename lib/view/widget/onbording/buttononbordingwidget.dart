import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/onbording_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/data/datasource/static.dart';

class ButtonOnBordingWidget extends GetView<OnBordingController> {
  const ButtonOnBordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingController>(
        builder: (controller) => InkWell(
              onTap: () {
                controller.next();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: controller.crrentpage == onbordinglist.length - 1
                        ? AppColor.lastbuttononbording
                        : AppColor.buttononbording,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                width: 250,
                height: 45,
                child: Text(
                  controller.crrentpage == onbordinglist.length - 1
                      ? "getstarted".tr
                      : "next".tr,
                  style: TextStyle(color: AppColor.white, fontSize: 17),
                ),
              ),
            ));
  }
}
