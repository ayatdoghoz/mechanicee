//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/driver/settingcontroller.dart';
import 'package:mechanice/controller/mechanice/settigcontroller.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return IconButton(
      icon: Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
        fill: 0.3,
      ),
      onPressed: () {
        controller.goToSetting();
      },
    );
  }
}
