import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class OrderData {
  Crud crud;

  OrderData(this.crud);

  getData(String d_id, String m_id, String paymentmethod, String d_lat,
      String d_long, String price) async {
    var response = await crud.postData(AppLink.dorder, {
      "d_id": d_id.toString(),
      "m_id": m_id.toString(),
      "paymentmethod": paymentmethod.toString(),
      "d_lat": d_lat.toString(),
      "d_long": d_long.toString(),
      "price": price.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
