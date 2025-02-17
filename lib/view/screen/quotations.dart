import 'package:elmahdy/controller/quotations_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/view/widget/customaddphotosbox.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotationsPage extends StatelessWidget {
  const QuotationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuotationsController controller = Get.put(QuotationsController());
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.addq();
            },
            child: Container(
                margin: EdgeInsets.only(bottom: 50),
                alignment: Alignment.center,
                height: 60,
                width: 220,
                decoration: BoxDecoration(
                    color: AppColor.buttononbording,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "send".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("quotations".tr),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<QuotationsController>(
              builder: (controller) => Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        TextFiledAddinfoWidget(
                          mycontroller: controller.name,
                          maxLines: 1,
                          obscureText: false,
                          valid: (val) {
                            return validInputemp(
                              val!,
                              1,
                              50,
                            );
                          },
                          title: "Name".tr,
                        ),
                        SizedBox(height: 10),
                        TextFiledAddinfoWidget(
                          mycontroller: controller.phone,
                          maxLines: 1,
                          obscureText: false,
                          valid: (val) {
                            return validInputemp(
                              val!,
                              1,
                              50,
                            );
                          },
                          title: "phone".tr,
                        ),
                        SizedBox(height: 10),
                        TextFiledAddinfoWidget(
                          mycontroller: controller.notes,
                          maxLines: 3,
                          obscureText: false,
                          valid: (val) {
                            return validInputemp(
                              val!,
                              0,
                              500,
                            );
                          },
                          title: "Notes".tr,
                        ),
                        SizedBox(height: 10),
                        CustomAddPhotosBox()
                      ],
                    ),
                  ))),
    );
  }
}
