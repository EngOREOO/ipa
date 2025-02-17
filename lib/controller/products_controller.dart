import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/products_data.dart';
import 'package:elmahdy/data/datasource/remote/search_data.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  ProductsData productsData = ProductsData(Get.find());
  LoadMoreData load = LoadMoreData(Get.find());
  SearchData searchData = SearchData(Get.find());

  List products = [];

  late StatusRequest statusRequest;
  late String nextPageUrl;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await productsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        products.addAll(response["data"]);
        nextPageUrl = response["pagination"]["next_page_url"] ?? '';
      } else {}
    }
    update();
  }

  loadMoreData() async {
    statusRequest = StatusRequest.loading;

    if (nextPageUrl.isNotEmpty) {
      var response = await load.getData(nextPageUrl);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == true) {
          products.addAll(response["data"]);
          nextPageUrl = response["pagination"]["next_page_url"] ?? '';
        } else {}
      }
      update();
    }
  }

  search(String name) async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData(name);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        products.clear();
        products.addAll(response["data"]);
        update();
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
