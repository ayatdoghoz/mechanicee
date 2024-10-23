import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/data/datasource/remote/auth/driver/checkemail.dart';

abstract class DForgetPassController extends GetxController {
  goToResetPass();
}

class DForgetPassControllerImp extends DForgetPassController {
  DCheckEmailData checkEmailData = DCheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPass() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.looding;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.toNamed('dresetpass', arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "تنبيه", middleText: "البريد غير موجود");
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

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
