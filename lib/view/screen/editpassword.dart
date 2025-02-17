import 'package:elmahdy/controller/editprofile_controller.dart.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/view/widget/textfiledaccountwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

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
              controller.editpassword();
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
        title: Text("Change Password".tr),
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
                    obscureText: true,
                    mycontroller: controller.password,
                    valid: (val) {
                      return validInput(
                        val!,
                        5,
                        80,
                      );
                    },
                    title: "your password".tr,
                    hint: "**********",
                  ),
                  SizedBox(height: 20),
                  TextFiledAccountWidget(
                    obscureText: true,
                    mycontroller: controller.newpassword,
                    valid: (val) {
                      return validInput(
                        val!,
                        5,
                        80,
                      );
                    },
                    title: "new password".tr,
                    hint: "**********",
                  ),
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
