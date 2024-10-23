import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class DLoginData {
  Crud crud;

  DLoginData(this.crud);

  postData(String email, String pass) async {
    var response = await crud.postData(AppLink.dlogin, {
      "pass": pass,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
