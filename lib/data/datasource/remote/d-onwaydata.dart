import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class OnWayData {
  Crud crud;

  OnWayData(this.crud);

  getData(String id, String onWay) async {
    var response = await crud.postData(
        AppLink.donway, {"id": id.toString(), "onway": onWay.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
