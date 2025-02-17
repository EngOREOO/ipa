import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.PostData(Applink.login, {
      "input_type": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
