import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/data/datasource/remote/auth/mechanice/resetpass.dart';

abstract class ResetController extends GetxController {
  goToSuccessReset();
}

class ResetControllerImp extends ResetController {
  ResetPassData resetPassData = ResetPassData(Get.find());
  late TextEditingController pass;
  late TextEditingController repass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  String? email;

  @override
  goToSuccessReset() async {
    if (pass.text != repass.text) {
      return Get.defaultDialog(
          title: "تنبيه", middleText: "كلمة السر غير متطابقة");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.looding;
      update();
      var response = await resetPassData.postData(email!, pass.text);
      print("=============================== Controller $response ");
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed("success", arguments: {"email": email});
        } else {
          Get.defaultDialog(title: "ُتنبيه", middleText: "حاول مجددا");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    pass = TextEditingController();
    repass = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    pass.dispose();
    repass.dispose();
    super.dispose();
  }
}
