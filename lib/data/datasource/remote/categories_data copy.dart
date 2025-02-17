import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class AllBrandsData {
  Crudg crudg;
  AllBrandsData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.allbrands,
    );
    return response.fold((l) => l, (r) => r);
  }
}
