import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/auth/driver/login.dart';

abstract class DriverLoginController extends GetxController {
  login();
  goToRegester();
  goToForgetPass();
}

class LoginControllerImp extends DriverLoginController {
  DLoginData loginData = DLoginData(Get.find());
  late TextEditingController email;
  late TextEditingController pass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.looding;
      update();
      var response = await loginData.postData(email.text, pass.text);
      print("=============================== Controller $response ");
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          var userData = response['data'][0];
          myServices.sharedPreferences
              .setString("id", userData['id'].toString());
          String driverid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("email", userData['email'].toString());
          myServices.sharedPreferences
              .setString("username", userData['username'].toString());
          myServices.sharedPreferences
              .setString("phone", userData['phone'].toString());
          myServices.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance.subscribeToTopic("driver${driverid}");

          Get.offNamed('driverselect');
        } else {
          Get.defaultDialog(
              title: "تنبيه", middleText: "البريد او كلمة السر غير صحيحة");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToRegester() {
    Get.toNamed('dregester');
  }

  @override
  goToForgetPass() {
    Get.toNamed('dforgetpass');
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }
}
