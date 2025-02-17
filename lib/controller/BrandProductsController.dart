import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/categoriesproducts/brandproducts_data.dart';
import 'package:elmahdy/data/datasource/remote/products_data.dart';
import 'package:get/get.dart';

class BrandProductsController extends GetxController {
  BrandProductsData brandProductsData = BrandProductsData(Get.find());
  BrandLoadMoreData load = BrandLoadMoreData(Get.find());
  RowProductsData rowProductsData = RowProductsData(Get.find());
  var infobrand;
  int? selectedcat;
  List products = [];
  List categories = [];

  late StatusRequest statusRequest;
  String nextPageUrl = '';

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await brandProductsData.getData("${infobrand["id"]}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        print(response);
        categories.addAll(response["data"]["categories"]);
        products.addAll(response["data"]["products"]);
        nextPageUrl = response["data"]["pagination"]["next_page_url"] ?? '';
      }
    }
    update();
  }

  getRowdata(String id) async {
    products.clear();

    statusRequest = StatusRequest.loading;
    update();

    var response = await rowProductsData.getData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response["data"]);
      if (response["status"] == true) {
        products.addAll(response["data"]);
        nextPageUrl = response["pagination"]["next_page_url"] ?? '';
        print(nextPageUrl);
        print("##############################################3");
      }
    }
    update();
  }

  loadMoreData() async {
    statusRequest = StatusRequest.loading;

    if (nextPageUrl.isNotEmpty) {
      var response = await load.getData(nextPageUrl);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        products.addAll(response["data"]["products"]);
        nextPageUrl = response["data"]["pagination"]["next_page_url"] ?? '';
      }
      update();
    }
  }

  @override
  void onInit() async {
    infobrand = Get.arguments["info"];
    print(infobrand);

    getdata();
    super.onInit();
  }
}

class ChildrenBrandProductsController extends GetxController {
  BrandProductsData brandProductsData = BrandProductsData(Get.find());
  RowProductsData rowProductsData = RowProductsData(Get.find());

  BrandLoadMoreData load = BrandLoadMoreData(Get.find());
  var infobrand;
  int? selectedcat;

  List products = [];
  List categories = [];

  late StatusRequest statusRequest;
  late String nextPageUrl;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await brandProductsData.getData("${infobrand["id"]}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("object");
      if (response["status"] == true) {
        categories.addAll(response["data"]["categories"]);
        products.addAll(response["data"]["products"]);
        nextPageUrl = response["data"]["pagination"]["next_page_url"] ?? '';
      } else {}
    }
    update();
  }

  getRowdata(String id) async {
    products.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await rowProductsData.getData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response["data"]);
      if (response["status"] == true) {
        products.clear();
        products.addAll(response["data"]);
        nextPageUrl = response["pagination"]["next_page_url"] ?? '';
      }
    }
    update();
  }

  loadMoreData() async {
    statusRequest = StatusRequest.loading;

    if (nextPageUrl.isNotEmpty) {
      var response = await load.getData(nextPageUrl);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        // products.addAll(response["data"]["products"]);
        // nextPageUrl = response["data"]["pagination"]["next_page_url"] ?? '';
        if (response["status"] == true) {
          print(response);
          products.addAll(response["data"]["products"]);
          nextPageUrl = response["data"]["pagination"]["next_page_url"] ?? '';
        } else {}
      }
      update();
    }
  }

  @override
  void onInit() async {
    infobrand = Get.arguments["info"];
    print(infobrand);

    getdata();
    super.onInit();
  }
}
