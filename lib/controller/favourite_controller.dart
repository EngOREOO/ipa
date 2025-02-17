import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/data/datasource/remote/favourite_data.dart';
import 'package:elmahdy/data/datasource/remote/getusercart_data.dart';
import 'package:elmahdy/data/datasource/remote/makeorder_data.dart';
import 'package:elmahdy/view/widget/addinfoorderwidget.dart';
import 'package:elmahdy/view/widget/auth/textfieldloginwidget.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  GetFavouriteData getFavouriteData = GetFavouriteData(Get.find());
  RemoveFavouriteData removeFavouriteData = RemoveFavouriteData(Get.find());

  late TextEditingController notes;

  List data = [];

  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await getFavouriteData.getData();
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

  removefav(int id) async {
    statusRequest = StatusRequest.loading;
    var response = await removeFavouriteData.getData("${id}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.clear();
      getdata();
    }
    update();
  }

  @override
  void onInit() async {
    getdata();
    super.onInit();
  }
}
