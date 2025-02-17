import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class AdsHomeData {
  Crudg crudg;
  AdsHomeData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.ads,
    );
    return response.fold((l) => l, (r) => r);
  }
}
