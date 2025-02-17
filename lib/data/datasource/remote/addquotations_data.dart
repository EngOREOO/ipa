import 'dart:io';

import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class AddQuotationsData {
  Crudwithfiles crud;
  AddQuotationsData(this.crud);

  postData(String name, String phone, String notes, File? myfile) async {
    var response = await crud.PostDataWithFiles(
        Applink.quotations,
        {
          "name": name,
          "phone": phone,
          // "notes": notes,
          if (notes != null) "notes": notes,
        },
        myfile != null ? myfile : null);
    return response.fold((l) => l, (r) => r);
  }
}
