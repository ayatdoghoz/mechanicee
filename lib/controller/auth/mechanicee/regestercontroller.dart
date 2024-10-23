import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/data/datasource/remote/auth/mechanice/regester.dart';

abstract class RegesterController extends GetxController {
  regester();
  goToLogin();
}

class RegesterControllerImp extends RegesterController {
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController pass;
  late TextEditingController phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  RegesterData regesterData = RegesterData(Get.find());

  List data = [];
  @override
  goToLogin() {
    Get.back();
  }

  @override
  regester() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.looding;
      update();
      var response = await regesterData.postData(
          username.text, email.text, phone.text, pass.text);
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed('successregester');
        } else {
          Get.defaultDialog(
              title: "تنبيه",
              middleText: 'تم استخدام البريد أو رقم الهاتف في حساب آخر');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not validet');
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
