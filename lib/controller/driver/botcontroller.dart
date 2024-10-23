import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/data/datasource/remote/botdata.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handelingdata.dart';
import '../../core/services/services.dart';

class BotController extends GetxController {
  late TextEditingController question;
  MyServices myServices = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;
  BotData botdata = BotData(Get.find());

  getData() async {
    var response = await botdata.postData(question.text);
    print("=============================== Controller $response ");

    if (response['response'] != null) {
      Get.dialog(
        AlertDialog(
          title: Text(
            ': الميكانيكي الذكي',
            textAlign: TextAlign.end,
          ),
          content: Text(response['response'], textAlign: TextAlign.end),
          // actions: [
          //   TextButton(
          //     child: Text('موافق'),
          //     onPressed: () {
          //       Get.back();
          // //     },
          //   ),
          // ],
        ),
      );
    } else {
      Get.snackbar(
        'خطأ',
        'يرجى إعادة المحاولة',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    question.clear(); // مسح حقل النص

    update();
  }

  @override
  void onInit() {
    question = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    question.dispose();
    super.dispose();
  }
}
