import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/adshome_data.dart';
import 'package:elmahdy/data/datasource/remote/products_data.dart';
import 'package:elmahdy/data/datasource/remote/search_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchproductController extends GetxController {
  SearchData searchData = SearchData(Get.find());
  List products = [];
  String? name;
  late TextEditingController title;

  late StatusRequest statusRequest;
  late String nextPageUrl;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData(name!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);

      if (response["status"] == true) {
        print(response["data"]);
        products.addAll(response["data"]);
      }
    }
    update();
  }

  search(String name) async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData(name);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        print(response["data"]);

        products.clear();
        products.addAll(response["data"]);
        update();
      } else {}
    }
    update();
  }

  @override
  void onInit() async {
    name = Get.arguments?["name"];

    title = TextEditingController(text: name);
    getdata();
    super.onInit();
  }
}
