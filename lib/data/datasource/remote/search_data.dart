import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class SearchData {
  Crudg crudg;
  SearchData(this.crudg);

  getData(String name) async {
    var response = await crudg.getData(
      "${Applink.search}$name",
    );
    return response.fold((l) => l, (r) => r);
  }
}
