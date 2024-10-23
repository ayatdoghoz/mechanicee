import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class OrderStatusData {
  Crud crud;

  OrderStatusData(this.crud);

  getData(String request_id) async {
    var response = await crud
        .postData(AppLink.dorderstatus, {"request_id": request_id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  finish(String m_id, String request_id) async {
    var response = await crud.postData(AppLink.dfinish,
        {"m_id": m_id.toString(), "request_id": request_id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
