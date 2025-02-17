import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/educations_data.dart';
import 'package:elmahdy/data/datasource/remote/latestproducts_data.dart';
import 'package:elmahdy/data/datasource/remote/offersproducts_data.dart';
import 'package:elmahdy/data/datasource/remote/products_data.dart';
import 'package:get/get.dart';

class EducationsController extends GetxController {
  EducationsData educationsData = EducationsData(Get.find());
  List data = [];

  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await educationsData.getData();
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
