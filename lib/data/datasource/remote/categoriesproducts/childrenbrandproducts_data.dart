import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class ChildrenBrandProductsData {
  Crudg crudg;
  ChildrenBrandProductsData(this.crudg);

  getData(String brandid) async {
    var response = await crudg.getData(
      "${Applink.brandproducts}/$brandid?per_page=30",
    );
    return response.fold((l) => l, (r) => r);
  }
}

class ChildrenBrandLoadMoreData {
  Crudg crudg;
  ChildrenBrandLoadMoreData(this.crudg);

  getData(String nextPageUrl) async {
    var response = await crudg.getData(nextPageUrl);
    return response.fold((l) => l, (r) => r);
  }
}
