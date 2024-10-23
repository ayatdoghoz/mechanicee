import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/auth/mechanice/login.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  login();
  goToRegester();
  goToForgetPass();
}

class LLoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  late TextEditingController email;
  late TextEditingController pass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  late String onway;
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
          var userData = response['data'][0]; // العنصر الأول في قائمة البيانات
          myServices.sharedPreferences
              .setString("id", userData['id'].toString());
          String id = myServices.sharedPreferences.getString("id").toString();
          var nextresponse = await loginData.NextLoginData(
              myServices.sharedPreferences.getString("id").toString());
          print("=============================== Controller $nextresponse ");
          if (nextresponse['status'] == "success") {
            myServices.sharedPreferences.setString("mstep", "1");
            Get.offNamed('home');
            FirebaseMessaging.instance.subscribeToTopic("mechanicee${id}");
          } else {
            myServices.sharedPreferences.setString("mstep", "2");

            Get.offNamed('type');
          }
        } else {
          Get.defaultDialog(
              title: "تنبيه", middleText: "البريد أو كلمة المرور غير صحيحة");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToRegester() {
    Get.toNamed('regester');
  }

  goToForgetPass() {
    Get.toNamed('forgetpass');
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });

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
