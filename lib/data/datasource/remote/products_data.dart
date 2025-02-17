import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class ProductsData {
  Crudg crudg;
  ProductsData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.products,
    );
    return response.fold((l) => l, (r) => r);
  }
}

class LoadMoreData {
  Crudg crudg;
  LoadMoreData(this.crudg);

  getData(String nextPageUrl) async {
    var response = await crudg.getData(nextPageUrl);
    return response.fold((l) => l, (r) => r);
  }
}
