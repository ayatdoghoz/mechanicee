import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class CountData {
  Crud crud;

  CountData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.count, {});
    return response.fold((l) => l, (r) => r);
  }
}
