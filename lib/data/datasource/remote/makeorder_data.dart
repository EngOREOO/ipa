import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class MakeOrderData {
  Crudtoken crud;
  MakeOrderData(this.crud);

  postData(String state, String? city, String? street, String? notes,
      String? code) async {
    var response = await crud.PostData(Applink.makeorder, {
      "state": state,
      "city": city,
      "street": street,
      "notes": notes,
      if (code!.isNotEmpty) "code": code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
