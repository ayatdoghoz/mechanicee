import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class DRegesterData {
  Crud crud;

  DRegesterData(this.crud);

  postData(String username, String email, String phone, String pass) async {
    var response = await crud.postData(AppLink.dregester, {
      "username": username,
      "phone": phone,
      "pass": pass,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
