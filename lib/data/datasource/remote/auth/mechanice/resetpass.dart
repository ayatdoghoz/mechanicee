import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class ResetPassData {
  Crud crud;

  ResetPassData(this.crud);

  postData(String email, String pass) async {
    var response = await crud.postData(AppLink.resetpass, {
      "pass": pass,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
