import 'package:elmahdy/bindings/intialbinding.dart';
import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/auth/login_data.dart';
import 'package:elmahdy/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  bool isshowpassword = true;
  MyServices myServices = Get.find();

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  // var autoValidateMode = AutovalidateMode.disabled.obs;

  // forgetpassword() {
  //   Get.offNamed(AppRoutes.checkemailforgetpass);
  // }

  login() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      update();
      statusRequest = StatusRequest.loading;

      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == true) {
          myServices.sharedPreferences
              .setString("token", response["data"]["token"]);
          myServices.sharedPreferences
              .setString("id", response["data"]["id"].toString());
          myServices.sharedPreferences
              .setString("name", response["data"]["name"]);
          myServices.sharedPreferences
              .setString("email", response["data"]["email"]);
          myServices.sharedPreferences
              .setString("phone", response["data"]["phone"]);
          myServices.sharedPreferences
              .setString("phone", response["data"]["phone"]);

          List checkpoints = response["data"]["points"];
          int points = (checkpoints.isNotEmpty) ? checkpoints[0]["points"] : 0;
          myServices.sharedPreferences.setInt("points", points);
          print(myServices.sharedPreferences.getInt("points"));

          Get.offAllNamed(AppRoutes.mainpage);
          print(response);
          update();
        } else if (response["status"] == false) {
          Get.snackbar('error'.tr, 'Wrong email or password'.tr,
              backgroundColor: AppColor.black,
              colorText: AppColor.white,
              snackPosition: SnackPosition.TOP, onTap: (snack) {
            Get.back();
          });
        }
      }

      update();
    } else {
      print("Form not valid");
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
