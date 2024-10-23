import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/request.dart';
import 'package:mechanice/data/model/request.dart';

class OrderController extends GetxController {
  RequestData requestData = RequestData(Get.find());
  MyServices myServices = Get.find();
  double? currentlat;
  double? currentlong;

  late String name;
  List<requestModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response = await requestData
        .getData(myServices.sharedPreferences.getString("id").toString());
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => requestModel.fromJson(e)));
      }
    }
    update();
  }

  approv(
    String request_id,
    String d_id,
  ) async {
    data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response = await requestData.approv(
      request_id,
      d_id,
    );
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
      } else {}
    }
    update();
  }

  refrehOrder() {
    getData();
  }

  goToLocation(
    String request_id,
    String d_lat,
    String d_long,
  ) {
    Get.toNamed("orderlocation", arguments: {
      "request_id": request_id,
      "d_lat": d_lat,
      "d_long": d_long,
    });
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
