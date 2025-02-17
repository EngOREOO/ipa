import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class EducationsData {
  Crudg crudg;
  EducationsData(this.crudg);

  getData() async {
    var response = await crudg.getData(
      Applink.educations,
    );
    return response.fold((l) => l, (r) => r);
  }
}
