import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/latestproducts_data.dart';
import 'package:elmahdy/data/datasource/remote/offersproducts_data.dart';
import 'package:elmahdy/data/datasource/remote/products_data.dart';
import 'package:get/get.dart';

class OffersProductsController extends GetxController {
  OffersProductsData productsData = OffersProductsData(Get.find());
  OffersProductsLoadMoreData load = OffersProductsLoadMoreData(Get.find());
  List products = [];

  late StatusRequest statusRequest;
  late String nextPageUrl;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await productsData.getData();
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        print(response["data"]);
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
        if (response["status"] == true) {
          products.addAll(response["data"]);
          nextPageUrl = response["pagination"]["next_page_url"] ?? '';
        } else {}
      }
      update();
    }
  }

  @override
  void onInit() async {
    getdata();
    super.onInit();
  }
}
