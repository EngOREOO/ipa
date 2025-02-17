import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/addtofavourite_data.dart';
import 'package:elmahdy/data/datasource/remote/cart_data.dart';
import 'package:elmahdy/data/datasource/remote/favourite_data.dart';
import 'package:elmahdy/data/datasource/remote/productdetails_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsData productDetailsData = ProductDetailsData(Get.find());
  AddToCartData addToCartData = AddToCartData(Get.find());
  AddtoFavouriteData addtoFavouriteData = AddtoFavouriteData(Get.find());
  RemoveFavouriteData removeFavouriteData = RemoveFavouriteData(Get.find());

  MyServices myServices = Get.find();

  int? idproduct;
  late StatusRequest statusRequest;
  int quantity = 1;
  int? selectindex;
  int? selectindexoptions;
  Map<String, dynamic> product = {};
  int? variantsid;
  int? optionsid;
  List variants = [];
  List options = [];
  var photo;
  String type = "product";

  changetype() {
    if (variants.isNotEmpty) {
      type = "value";
    }
    if (options.isNotEmpty) {
      type = "option";
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await productDetailsData.getData(idproduct!
        // 777
        // 1074
        // 912
        // 980
        );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response["data"]);
      product = response["data"];
      variants = product["variants"];
      photo = response["data"]["image"];
      product["fav"] == 0 ? isfav = false : isfav = true;
      print(photo);
    }
    update();
  }

  addtoCart() async {
    if (myServices.sharedPreferences.getString("token") == null) {
      Get.toNamed(AppRoutes.login);
    } else {
      if (variants.isNotEmpty && selectindex == null) {
        Get.snackbar("notfi".tr, "Pleasecompletetheselections".tr,
            backgroundColor: AppColor.black,
            colorText: AppColor.white, onTap: (snack) {
          Get.back();
        });
      } else if (options.isNotEmpty && selectindexoptions == null) {
        Get.snackbar("notfi", "Pleasecompletetheselections".tr,
            backgroundColor: AppColor.black,
            colorText: AppColor.white, onTap: (snack) {
          Get.back();
        });
      } else {
        changetype();
        // Get.dialog(
        //     barrierDismissible: false,
        //     AlertDialog(
        //       content: Container(
        //           height: 200,
        //           child: Lottie.asset(AppImageAssets.lampload,
        //               width: 100,
        //               height: 100,
        //               frameRate: FrameRate.max,
        //               fit: BoxFit.cover,
        //               filterQuality: FilterQuality.high)),
        //     ));

        statusRequest = StatusRequest.loading;
        var response = await addToCartData.postData(
            "${quantity}",
            type,
            "${idproduct}",
            "${variants.isNotEmpty ? variantsid : "0"}",
            "${options.isNotEmpty ? optionsid : '0'}");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          // Get.back();
          Get.snackbar(
            "done".tr,
            "Theproducthasbeenaddedtothecart".tr,
            colorText: AppColor.white,
            backgroundColor: AppColor.black,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 55),
            onTap: (snack) {
              // إغلاق Snackbar عند النقر عليه
              Get.back();
            },
          );
          quantity = 1;
          update();
        } else {
          Get.snackbar("error".tr, "Pleasetryagain".tr,
              colorText: AppColor.white,
              backgroundColor: AppColor.black,
              snackPosition: SnackPosition.TOP,
              margin: EdgeInsets.only(top: 55), onTap: (snack) {
            Get.back();
          });
        }
        update();
      }
    }
  }

  addtooptions(List data, int index, int Variantsid, var newphoto) {
    if (newphoto != 0) {
      if (newphoto is Map) {
        photo = [newphoto];
      } else {
        photo = newphoto;
      }
    }
    selectindex = null;
    options = [];
    variantsid = null;
    selectindexoptions = null;
    update();
    print("object");

    selectindex = index;
    options = data;
    variantsid = Variantsid;

    update();
  }

  changeoptions(var newphoto, int id) {
    if (newphoto is Map) {
      photo = [newphoto]; // تغليف الخريطة داخل قائمة
    } else {
      photo = newphoto; // إذا كانت newphoto ليست خريطة، يتم تعيينها مباشرة
    }
    print(photo);

    optionsid = id;
    update();
  }

  addquantity() {
    quantity = quantity + 1;
    update();
  }

  removequantity() {
    quantity == 1 ? null : quantity = quantity - 1;
    update();
  }

  bool? isfav = false;

  addtofav() async {
    // تحقق من وجود التوكن
    if (myServices.sharedPreferences.getString("token") == null) {
      Get.toNamed(AppRoutes.login);
    } else {
      // تحقق إذا كانت product["fav"] == 0
      if (isfav == false) {
        // statusRequest = StatusRequest.loading;
        update();

        // إرسال الطلب لإضافة المنتج للمفضلة
        var response = await addtoFavouriteData.postData("${idproduct!}");
        statusRequest = handlingData(response);

        // تحقق مما إذا كانت العملية ناجحة
        if (StatusRequest.success == statusRequest) {
          isfav = true;
          print(response);
        }

        update();
      } else {
        // statusRequest = StatusRequest.loading;
        var response = await removeFavouriteData.getData("${idproduct!}");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          isfav = false;
        }
        update();
      }
    }
  }

  Color hexToColor(String hexCode) {
    return Color(int.parse(hexCode.replaceAll('#', '0xff')));
  }

  @override
  void onInit() async {
    idproduct = Get.arguments["idproduct"];
    getData();
    super.onInit();
  }
}
