import 'dart:io';

import 'package:mechanice/constant/linkapi.dart';
import 'package:mechanice/core/class/crud.dart';

class InfoData {
  Crud crud;

  InfoData(this.crud);

  getData(String m_id) async {
    var response = await crud.postData(AppLink.home, {
      "m_id": m_id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(
    String storename,
    String owner_name,
    String storephone,
    String disc,
    String m_id,
    String c_id,
    String start,
    String end,
    String onway,
    String address_long,
    String address_lat,
    File file,
  ) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.addinfo,
        {
          "storename": storename.toString(),
          "owner_name": owner_name.toString(),
          "storephone": storephone.toString(),
          "disc": disc.toString(),
          "m_id": m_id.toString(),
          "c_id": c_id.toString(),
          "start": start.toString(),
          "end": end.toString(),
          "onway": onway.toString(),
          "address_long": address_long.toString(),
          "address_lat": address_lat.toString(),
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
