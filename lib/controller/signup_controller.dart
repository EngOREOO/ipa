import 'package:elmahdy/bindings/intialbinding.dart';
import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  bool isshowpassword = true;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  register() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      update();
      statusRequest = StatusRequest.loading;

      var response = await signupData.postData(
          name.text, email.text, phone.text, password.text);
      statusRequest = handlingData(response);
      update();

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

          myServices.sharedPreferences.setInt("points", 0);

          Get.offAllNamed(AppRoutes.mainpage);
          update();
        } else if (response["status"] == false) {
          if (response["message"] == "email already exists") {
            Get.snackbar('error'.tr, 'Email already exists'.tr,
                backgroundColor: AppColor.black,
                colorText: AppColor.white,
                snackPosition: SnackPosition.TOP, onTap: (snack) {
              Get.back();
            });
          } else if (response["message"] == "phone already exists") {
            Get.snackbar('error'.tr, 'Phone already exists'.tr,
                backgroundColor: AppColor.black,
                colorText: AppColor.white,
                snackPosition: SnackPosition.TOP, onTap: (snack) {
              Get.back();
            });
          }
        }
////
      }

      update();
    } else {
      print("Form not valid");
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
