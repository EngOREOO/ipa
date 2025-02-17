import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class BrandProductsData {
  Crudg crudg;
  BrandProductsData(this.crudg);

  getData(String brandid) async {
    var response = await crudg.getData(
      "${Applink.brandproducts}/$brandid?per_page=30",
    );
    return response.fold((l) => l, (r) => r);
  }
}

class RowProductsData {
  Crudg crudg;
  RowProductsData(this.crudg);

  getData(String id) async {
    var response = await crudg.getData(
        "https://elmahdy-techno-light.com/api/brand/category/products/$id?per_page=30");
    return response.fold((l) => l, (r) => r);
  }
}

class BrandLoadMoreData {
  Crudg crudg;
  BrandLoadMoreData(this.crudg);

  getData(String nextPageUrl) async {
    var response = await crudg.getData(nextPageUrl);
    return response.fold((l) => l, (r) => r);
  }
}
