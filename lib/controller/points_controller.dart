import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/functions/handlingdata.dart';
import 'package:elmahdy/data/datasource/remote/points_data.dart';
import 'package:get/get.dart';

class PointsController extends GetxController {
  List data = [];
  String points = "0";
  String code = "";

  GetPointsData getPointsData = GetPointsData(Get.find());
  GenerateCodePointsData generateCode = GenerateCodePointsData(Get.find());
  late StatusRequest statusRequest;
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await getPointsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data = [response['data']];

      points = response['data']['points'].isNotEmpty
          ? response['data']['points']["points"].toString()
          : "0";
      code = response['data']['offers'].isNotEmpty
          ? response['data']['offers']["code"]
          : "";
    }
    update();
  }

  getcode() async {
    if (int.parse(points) > 10) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await generateCode.getData();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          points = "0";
          code = response['data']["offers"]['code'];
        } else {
          print("غيركافي");
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
