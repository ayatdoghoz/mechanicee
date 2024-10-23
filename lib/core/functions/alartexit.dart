import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExit() {
  Get.defaultDialog(
      title: "تنبيه",
      middleText: 'هل تريد الخروج من التطبيق',
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text('تأكيد'),
        ),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('إلغاء'))
      ]);
  return Future.value(true);
}
