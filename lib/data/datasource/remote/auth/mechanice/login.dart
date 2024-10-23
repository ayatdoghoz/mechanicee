import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData(String email, String pass) async {
    var response = await crud.postData(AppLink.login, {
      "pass": pass,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  NextLoginData(String m_id) async {
    var response = await crud.postData(AppLink.nextlogin, {
      "m_id": m_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
