import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.PostData(Applink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
