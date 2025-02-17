import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/data/datasource/remote/favourite_data.dart';
import 'package:elmahdy/data/datasource/remote/getusercart_data.dart';
import 'package:elmahdy/data/datasource/remote/makeorder_data.dart';
import 'package:elmahdy/data/datasource/remote/orders_data.dart';
import 'package:elmahdy/view/widget/addinfoorderwidget.dart';
import 'package:elmahdy/view/widget/auth/textfieldloginwidget.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());

  late TextEditingController notes;

  List data = [];

  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      if (response["status"] == true) {
        data.addAll(response["data"]);
        print(data);
      } else {}
    }
    update();
  }

  @override
  void onInit() async {
    getdata();
    super.onInit();
  }
}
