import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class CategoriesData {
  Crudg crudg;
  CategoriesData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.categories,
    );
    return response.fold((l) => l, (r) => r);
  }
}
