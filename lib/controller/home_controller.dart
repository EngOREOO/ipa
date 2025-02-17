import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/adshome_data.dart';
import 'package:elmahdy/data/datasource/remote/products_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AdsHomeData adsHomeData = AdsHomeData(Get.find());
  List data = [];

  late StatusRequest statusRequest;
  late String nextPageUrl;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await adsHomeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == true) {
        data.addAll(response["data"]);
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
