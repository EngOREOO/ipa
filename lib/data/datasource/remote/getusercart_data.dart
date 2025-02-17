import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class GetUserCartData {
  Crudgtoken crudgtoken;
  GetUserCartData(this.crudgtoken);

  getData() async {
    var response = await crudgtoken.getData(
      Applink.getusercart,
    );
    return response.fold((l) => l, (r) => r);
  }
}
