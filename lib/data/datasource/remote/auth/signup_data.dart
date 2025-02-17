import 'package:elmahdy/core/class/crud.dart';
import 'package:elmahdy/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String name, String email, String phone, String password) async {
    var response = await crud.PostData(Applink.signup, {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
