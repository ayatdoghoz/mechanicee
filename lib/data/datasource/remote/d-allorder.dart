import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class AllOrderData {
  Crud crud;

  AllOrderData(this.crud);

  getData(String d_id) async {
    var response =
        await crud.postData(AppLink.alldorder, {"d_id": d_id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String request_id) async {
    var response = await crud
        .postData(AppLink.deleteorder, {"request_id": request_id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
