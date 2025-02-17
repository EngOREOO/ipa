import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:elmahdy/linkapi.dart';
import 'package:get/get.dart';

class ProductDetailsData {
  Crudg crudg;
  MyServices myServices = Get.find();

  ProductDetailsData(this.crudg);

  getData(int idproduct) async {
    // احصل على قيمة id من SharedPreferences
    String? userId = myServices.sharedPreferences.getString("id");

    // بناء الرابط بناءً على ما إذا كان userId يحتوي على قيمة أم لا
    String url = Applink.productdetails + "/$idproduct";

    if (userId != null) {
      url +=
          "?user_id=$userId"; // أضف userId إلى الرابط إذا كانت id تحتوي على قيمة
    }

    var response = await crudg.getData(url);
    return response.fold((l) => l, (r) => r);
  }
}
