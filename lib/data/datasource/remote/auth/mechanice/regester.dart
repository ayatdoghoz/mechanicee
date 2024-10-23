import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class RegesterData {
  Crud crud;

  RegesterData(this.crud);

  postData(String username, String email, String phone, String pass) async {
    var response = await crud.postData(AppLink.regester, {
      "username": username,
      "phone": phone,
      "pass": pass,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
