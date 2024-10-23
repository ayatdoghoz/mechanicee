import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/services/services.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();

  goToSetting() {
    Get.toNamed("setting");
  }

  goToexit() {
    String id = myServices.sharedPreferences.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("mechanicee${id}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed("login");
  }

  @override
  void onInit() {
    super.onInit();
  }
}
