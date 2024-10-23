//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/driver/settingcontroller.dart';

class DAppBarAction extends StatelessWidget {
  const DAppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    DSettingController controller = Get.put(DSettingController());
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
