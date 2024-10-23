import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/home.dart';

class HomeController extends GetxController {
  InfoData infoData = InfoData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  String? onway;
  getData() async {
    statusRequest = StatusRequest.looding;
    var response = await infoData
        .getData(myServices.sharedPreferences.getString("id").toString());
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        var userData = response['data'][0]; // العنصر الأول في قائمة البيانات
        myServices.sharedPreferences
            .setString("onway", userData['onway'].toString());
        onway = myServices.sharedPreferences.getString("onway");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPreOrder() {
    Get.toNamed("preorder");
  }

  goToOrder() {
    Get.toNamed("orderpage");
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
