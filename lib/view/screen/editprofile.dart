import 'package:elmahdy/controller/editprofile_controller.dart.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/view/widget/textfiledaccountwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileController controller = Get.put(EditProfileController());
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.editprofile();
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
                  "edit".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("EditProfile".tr),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Form(
              child: Column(
                children: [
                  TextFiledAccountWidget(
                    mycontroller: controller.name,
                    valid: (val) {
                      return validInput(val!, 5, 20, "name");
                    },
                    title: "Name".tr,
                    hint: "john Doe",
                  ),
                  SizedBox(height: 20),
                  TextFiledAccountWidget(
                    mycontroller: controller.phone,
                    valid: (val) {
                      return validInput(val!, 5, 13, "phone");
                    },
                    title: "phone".tr,
                    hint: "000000",
                  ),
                  SizedBox(height: 20),
                  TextFiledAccountWidget(
                    mycontroller: controller.email,
                    valid: (val) {
                      return validInput(val!, 5, 200, "email");
                    },
                    title: "Email".tr,
                    hint: "example@email.com",
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 50,
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
