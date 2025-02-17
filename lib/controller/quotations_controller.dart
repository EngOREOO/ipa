import 'dart:io';

import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/data/datasource/remote/addquotations_data.dart';
import 'package:elmahdy/data/datasource/remote/cart_data.dart';
import 'package:elmahdy/data/datasource/remote/getusercart_data.dart';
import 'package:elmahdy/data/datasource/remote/makeorder_data.dart';
import 'package:elmahdy/view/widget/addinfoorderwidget.dart';
import 'package:elmahdy/view/widget/auth/textfieldloginwidget.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class QuotationsController extends GetxController {
  AddQuotationsData addQuotationsData = AddQuotationsData(Get.find());

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController notes;
  File? myfile;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late StatusRequest statusRequest;

  addfromg() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myfile = File(xfile!.path);
    Get.back();
    update();
  }

  addphotofromcamera() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    myfile = File(xfile!.path);
    Get.back();
    update();
  }

  addq() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await addQuotationsData.postData(
          name.text, phone.text, notes.text, myfile);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        if (response["status"] == true) {
          Get.back();
          Get.snackbar('done'.tr, 'Data has been sent'.tr,
              backgroundColor: AppColor.black,
              colorText: AppColor.white,
              snackPosition: SnackPosition.TOP, onTap: (snack) {
            Get.back();
          });
        } else {}
      }
      update();
    }
  }

  @override
  void onInit() async {
    name = TextEditingController();
    phone = TextEditingController();
    notes = TextEditingController();

    super.onInit();
  }
}
