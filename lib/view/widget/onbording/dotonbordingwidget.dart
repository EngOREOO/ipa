import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/onbording_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/data/datasource/static.dart';

class DotOnBordingWidget extends StatelessWidget {
  const DotOnBordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onbordinglist.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          duration: Duration(milliseconds: 600),
                          width: controller.crrentpage == index ? 15 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: controller.crrentpage == index
                                  ? AppColor.black
                                  : AppColor.smalldotonbording,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
