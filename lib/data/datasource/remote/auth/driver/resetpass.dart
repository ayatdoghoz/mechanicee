import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class DResetPassData {
  Crud crud;

  DResetPassData(this.crud);

  postData(String email, String pass) async {
    var response = await crud.postData(AppLink.dresetpass, {
      "pass": pass,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
