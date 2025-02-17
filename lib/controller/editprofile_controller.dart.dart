import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/editprofile_data.dart';
import 'package:elmahdy/data/datasource/remote/favourite_data.dart';
import 'package:elmahdy/data/datasource/remote/getusercart_data.dart';
import 'package:elmahdy/data/datasource/remote/makeorder_data.dart';
import 'package:elmahdy/data/datasource/remote/orders_data.dart';
import 'package:elmahdy/view/widget/addinfoorderwidget.dart';
import 'package:elmahdy/view/widget/auth/textfieldloginwidget.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  EditInfoData editInfoData = EditInfoData(Get.find());
  EditPasswordData editPasswordData = EditPasswordData(Get.find());
  MyServices myServices = Get.find();

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController newpassword;

  late StatusRequest statusRequest;

  editprofile() async {
    statusRequest = StatusRequest.loading;
    var response =
        await editInfoData.postData(name.text, phone.text, email.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        myServices.sharedPreferences.setString("name", name.text);
        myServices.sharedPreferences.setString("phone", phone.text);
        myServices.sharedPreferences.setString("email", email.text);
        Get.back();
        Get.snackbar("done".tr, "Personal information has been modified".tr,
            backgroundColor: AppColor.black,
            colorText: AppColor.white, onTap: (snack) {
          Get.back();
        });
      } else {}
    }
    update();
  }

  editpassword() async {
    statusRequest = StatusRequest.loading;
    var response = await editPasswordData.postData(password.text, name.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        Get.back();

        Get.snackbar("done".tr, "The password has been changed successfully".tr,
            backgroundColor: AppColor.black,
            colorText: AppColor.white, onTap: (snack) {
          Get.back();
        });
      } else {
        Get.snackbar("error".tr, "Your password is incorrect".tr,
            backgroundColor: AppColor.black,
            colorText: AppColor.white, onTap: (snack) {
          Get.back();
        });
      }
    }
    update();
  }

  @override
  void onInit() async {
    name = TextEditingController(
        text: myServices.sharedPreferences.getString("name"));
    email = TextEditingController(
        text: myServices.sharedPreferences.getString("email"));
    phone = TextEditingController(
        text: myServices.sharedPreferences.getString("phone"));
    password = TextEditingController();
    newpassword = TextEditingController();
    super.onInit();
  }
}
