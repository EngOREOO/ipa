import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class OffersProductsData {
  Crudg crudg;
  OffersProductsData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.latestproducts,
    );
    return response.fold((l) => l, (r) => r);
  }
}

class OffersProductsLoadMoreData {
  Crudg crudg;
  OffersProductsLoadMoreData(this.crudg);

  getData(String nextPageUrl) async {
    var response = await crudg.getData(nextPageUrl);
    return response.fold((l) => l, (r) => r);
  }
}
