import 'package:elmahdy/controller/quotations_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomAddPhotosBox extends StatelessWidget {
  const CustomAddPhotosBox({super.key});

  @override
  Widget build(BuildContext context) {
    QuotationsController controller = Get.put(QuotationsController());
    return InkWell(
        onTap: () async {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      controller.addfromg();
                    },
                    child: Text(
                      " صورة من الهاتف",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.addphotofromcamera();
                    },
                    child: Text(
                      "استخدام الكاميرا",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        child: GetBuilder<QuotationsController>(
          builder: (controller) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Check if an image is selected and display it
                controller.myfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          controller.myfile!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.add,
                        size: 50,
                        color: AppColor.white,
                      ),
                Text(
                  "addphoto".tr,
                  style: TextStyle(
                      fontSize: 18, color: AppColor.white, fontFamily: "cairo"),
                ),
              ],
            ),
          ),
        ));
  }
}
