import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/categories_data.dart';
import 'package:elmahdy/view/widget/brandbottomsheetwidget.dart';
import 'package:elmahdy/view/widget/brandcardcatwidget.dart';
import 'package:elmahdy/view/widget/sectiontitleproductwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesData productsData = CategoriesData(Get.find());
  MyServices myServices = Get.find();

  String? lang;

  late StatusRequest statusRequest;
  List categories = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await productsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      categories.addAll(response["data"]);
    }
    update();
  }

  Go(var info) {
    Get.toNamed(
      AppRoutes.SubCategoriesPage,
      arguments: {"info": info},
    );
  }

  @override
  void onInit() async {
    lang = myServices.sharedPreferences.getString("lang");

    getData();

    super.onInit();
  }
}

class SubCategoriesController extends GetxController {
  late StatusRequest statusRequest;
  String? lang;

  Map<String, dynamic> subcategories = {};
  List childreen = [];
  List brands = [];
  List childbrandslist = [];

  gotobrandproducts(var info) {
    Get.toNamed(AppRoutes.BrandProductsPage, arguments: {"info": info});
  }

  childbrands(List brands) {
    childbrandslist = brands;
    Get.bottomSheet(
      BrandBottomSheetWidget(),
    );
  }

  gotoChildbrandproducts(var info) {
    Get.toNamed(AppRoutes.ChildrenBrandProductsPage, arguments: {"info": info});
  }

  @override
  void onInit() async {
    MyServices myServices = Get.find();

    subcategories = Get.arguments["info"];
    lang = myServices.sharedPreferences.getString("lang");

    childreen.addAll(subcategories["childreen"]);
    brands.addAll(subcategories["brands"]);
    print(subcategories);
    super.onInit();
  }
}
