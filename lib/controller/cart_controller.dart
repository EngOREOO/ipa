import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/cart_data.dart';
import 'package:elmahdy/data/datasource/remote/getusercart_data.dart';
import 'package:elmahdy/data/datasource/remote/makeorder_data.dart';
import 'package:elmahdy/view/widget/addinfoorderwidget.dart';
import 'package:elmahdy/view/widget/auth/textfieldloginwidget.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  GetUserCartData getUserCartData = GetUserCartData(Get.find());
  MakeOrderData makeOrderData = MakeOrderData(Get.find());
  RemoveFromCartData removeFromCartData = RemoveFromCartData(Get.find());
  AddqtyCartData addqtyCartData = AddqtyCartData(Get.find());
  RemoveqtyCartData removeqtyCartData = RemoveqtyCartData(Get.find());
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController code;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  late TextEditingController notes;

  List data = [];

  late StatusRequest statusRequest;
  late String nextPageUrl;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await getUserCartData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        data.addAll(response["data"]["cart_items"]);
        print(data);
      }
    }
    update();
  }

  deleteproduct(int id) async {
    statusRequest = StatusRequest.loading;
    var response = await removeFromCartData.postData("${id}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.clear();
      getdata();
      update();
    } else {
      print(response);
    }
    update();
  }

  removeqty(int id) async {
    statusRequest = StatusRequest.loading;
    var response = await removeqtyCartData.postData("${id}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      data.clear();
      getdata();
      update();
    } else {
      print(response);
    }
    update();
  }

  addqty(int id) async {
    statusRequest = StatusRequest.loading;
    var response = await addqtyCartData.postData("${id}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      data.clear();
      getdata();
      update();
    } else {
      print(response);
    }
    update();
  }

  makeorder() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      update();

      statusRequest = StatusRequest.loading;
      var response = await makeOrderData.postData(
          state.text, city.text, street.text, notes.text, code.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == true) {
          data.clear();
          update();
          Get.back();
          Get.snackbar(
            "done".tr,
            "Your purchase order has been sent".tr,
            colorText: AppColor.white,
            backgroundColor: AppColor.black,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 55),
            onTap: (snack) {
              Get.back();
            },
          );

          print(response);
        } else {
          if (response["message"] == "error code") {
            Get.snackbar("error".tr, "errorcode".tr,
                colorText: AppColor.white,
                backgroundColor: AppColor.black,
                snackPosition: SnackPosition.TOP,
                margin: EdgeInsets.only(top: 55), onTap: (snack) {
              Get.back();
            });
          }
        }
      }
      update();
    } else {
      print("object");
    }
  }

  addinfodialog() {
    data.isEmpty
        ? Get.snackbar("error".tr, "Cart is Empty".tr,
            colorText: AppColor.white,
            backgroundColor: AppColor.black,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 55), onTap: (snack) {
            Get.back();
          })
        : Get.dialog(
            AlertDialog(
              title: Text(
                "Add info".tr,
                textAlign: TextAlign.center,
              ),
              content: AddInfoOrderWidget(),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("close".tr),
                ),
                TextButton(
                  onPressed: () {
                    makeorder();
                  },
                  child: Text("confirm".tr),
                ),
              ],
            ),
          );
  }

  @override
  void onInit() async {
    state = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    notes = TextEditingController();
    code = TextEditingController();

    getdata();
    super.onInit();
  }
}
