import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/driver/ordercontroller.dart';
import '../../controller/mechanice/ordercontroller.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("=============notification=============");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreashPageNotification(message.data);
  });
}

refreashPageNotification(data) {
  print("=============id======");
  print(data["pageid"]);
  print("=============name======");
  print(data["pagename"]);
  print("=============route======");

  print(Get.currentRoute);
  if (Get.currentRoute == "order" && data["pagename"] == "order") {
    OrderControllerImp controller = Get.find();
    controller.refrehOrder();
  }
  if (Get.currentRoute == "orderpage" && data["pagename"] == "finish") {
    OrderController controller = Get.find();
    controller.refrehOrder();
  }
  if (Get.currentRoute == "orderpage" && data["pagename"] == "order") {
    OrderController controller = Get.find();
    controller.refrehOrder();
  }
}
