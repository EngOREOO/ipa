import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class LatestProductsData {
  Crudg crudg;
  LatestProductsData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.latestproducts,
    );
    return response.fold((l) => l, (r) => r);
  }
}

class LatestProductsLoadMoreData {
  Crudg crudg;
  LatestProductsLoadMoreData(this.crudg);

  getData(String nextPageUrl) async {
    var response = await crudg.getData(nextPageUrl);
    return response.fold((l) => l, (r) => r);
  }
}
