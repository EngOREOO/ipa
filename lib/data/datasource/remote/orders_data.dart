import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class OrdersData {
  Crudgtoken crudgtoken;
  OrdersData(this.crudgtoken);

  getData() async {
    var response = await crudgtoken.getData(
      Applink.getorders,
    );
    return response.fold((l) => l, (r) => r);
  }
}
