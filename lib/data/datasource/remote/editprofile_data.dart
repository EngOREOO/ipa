import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class EditInfoData {
  Crudtoken crud;
  EditInfoData(this.crud);

  postData(
    String name,
    String? phone,
    String? email,
  ) async {
    var response = await crud.PostData(Applink.editprofile, {
      "name": name,
      "phone": phone,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}

class EditPasswordData {
  Crudtoken crud;
  EditPasswordData(this.crud);

  postData(
    String password,
    String? newpassword,
  ) async {
    var response = await crud.PostData(Applink.editpassword, {
      "password": password,
      "new_password": newpassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
