import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class GetFavouriteData {
  Crudgtoken crudgtoken;
  GetFavouriteData(this.crudgtoken);

  getData() async {
    var response = await crudgtoken.getData(
      Applink.getfavourite,
    );
    return response.fold((l) => l, (r) => r);
  }
}

class RemoveFavouriteData {
  Crudgtoken crudgtoken;
  RemoveFavouriteData(this.crudgtoken);

  getData(String idfav) async {
    var response = await crudgtoken.getData(
      "${Applink.removefavourite}/$idfav",
    );
    return response.fold((l) => l, (r) => r);
  }
}
