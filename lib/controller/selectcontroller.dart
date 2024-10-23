import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mechanice/data/datasource/remote/count.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handelingdata.dart';

class SelectController extends GetxController {
  CountData testdata = CountData(Get.find());
  late StatusRequest statusRequest;
  var count;

  driver() {
    Get.toNamed('dlogin');
  }

  mechanice() {
    Get.toNamed('login');
  }

  getData() async {
    statusRequest = StatusRequest.looding;
    var response = await testdata.getData();
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        count = response["data"];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
