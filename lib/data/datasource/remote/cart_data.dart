import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class AddToCartData {
  Crudtoken crud;
  AddToCartData(this.crud);

  postData(String? quantity, String? type, String? product_id, String? value_id,
      String? option_id) async {
    var response = await crud.PostData(Applink.addtocart, {
      "quantity": quantity,
      "type": type,
      "product_id": product_id,
      if (value_id != "0") "value_id": value_id,
      if (option_id != "0") "option_id": option_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

class RemoveFromCartData {
  Crudtoken crud;
  RemoveFromCartData(this.crud);

  postData(String id) async {
    var response = await crud.PostData("${Applink.removefromcart}/$id", {});
    return response.fold((l) => l, (r) => r);
  }
}

class RemoveqtyCartData {
  Crudtoken crud;
  RemoveqtyCartData(this.crud);

  postData(String id) async {
    var response = await crud.PostData("${Applink.cartqty}/$id", {
      "decrease": "decrease",
    });
    return response.fold((l) => l, (r) => r);
  }
}

class AddqtyCartData {
  Crudtoken crud;
  AddqtyCartData(this.crud);

  postData(String id) async {
    var response = await crud.PostData("${Applink.cartqty}/$id", {
      "increase": "increase",
    });
    return response.fold((l) => l, (r) => r);
  }
}
