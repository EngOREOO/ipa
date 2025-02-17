import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/data/datasource/remote/categories_data%20copy.dart';
import 'package:elmahdy/view/widget/brandbottomsheetwidget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BrandsController extends GetxController {
  AllBrandsData allBrandsData = AllBrandsData(Get.find());

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

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await allBrandsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        brands = response["data"];
      } else {}
    }
    update();
  }

  @override
  void onInit() async {
    getdata();
    MyServices myServices = Get.find();

    lang = myServices.sharedPreferences.getString("lang");

    super.onInit();
  }
}
