import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class DCheckEmailData {
  Crud crud;

  DCheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.dcheckemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
