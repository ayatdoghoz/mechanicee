import 'package:get/get.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DSettingController extends GetxController {
  MyServices myServices = Get.find();

  goToSetting() {
    Get.toNamed("dsetting");
  }

  goToOrder() {
    Get.toNamed("allorder");
  }

  goToexit() {
    String id = myServices.sharedPreferences.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("driver${id}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed("dlogin");
  }

  @override
  void onInit() {
    super.onInit();
  }
}
