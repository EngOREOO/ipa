import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class GetPointsData {
  Crudgtoken crudgtoken;
  GetPointsData(this.crudgtoken);

  getData() async {
    var response = await crudgtoken.getData(
      Applink.getpoints,
    );
    return response.fold((l) => l, (r) => r);
  }
}

class GenerateCodePointsData {
  Crudtoken Crudptoken;
  GenerateCodePointsData(this.Crudptoken);

  getData() async {
    var response = await Crudptoken.PostData(Applink.generatecodepoints, {});
    return response.fold((l) => l, (r) => r);
  }
}
