import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class RequestData {
  Crud crud;

  RequestData(this.crud);

  getData(String m_id) async {
    var response =
        await crud.postData(AppLink.request, {"m_id": m_id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getPreOrder(String m_id) async {
    var response =
        await crud.postData(AppLink.preorder, {"m_id": m_id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  approv(String request_id, String d_id) async {
    var response = await crud.postData(AppLink.approv,
        {"request_id": request_id.toString(), "d_id": d_id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
