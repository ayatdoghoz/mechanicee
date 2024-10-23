// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/services/services.dart';

import 'package:mechanice/data/datasource/remote/d-onwaydata.dart';

abstract class ServiceTypeController extends GetxController {
  intialData();

  // getItems(String category_id);
  goToAddLocation(String onWay, String id);
  goTomap(String onWay, String id);
}

class ServiceTypeControllerImp extends ServiceTypeController {
  MyServices myServices = Get.find();

  String? category_id;

  OnWayData onWayData = OnWayData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  @override
  void onInit() {
    intialData();

    super.onInit();
  }

  @override
  intialData() {
    category_id = Get.arguments['category_id'];
  }

  @override
  goToAddLocation(onWay, id) {
    Get.toNamed("dlocation", arguments: {"onWay": onWay, "category_id": id});
  }

  @override
  goTomap(onWay, id) {
    Get.toNamed("map", arguments: {"onWay": onWay, "category_id": id});
  }
}
