import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class AddtoFavouriteData {
  Crudtoken crud;
  AddtoFavouriteData(this.crud);

  postData(
    String idproduct,
  ) async {
    var response =
        await crud.PostData("${Applink.addtofavourite}/$idproduct", {});
    return response.fold((l) => l, (r) => r);
  }
}
