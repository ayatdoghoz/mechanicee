import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/view/widget/button.dart';

import '../../../../controller/auth/mechanicee/successregestercontroller.dart';

class SuccessRegester extends StatelessWidget {
  const SuccessRegester({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessRegesterControllerImp controller =
        Get.put(SuccessRegesterControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                'تم التحقق بنجاح ',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.verified_user_outlined,
                size: 150,
              ),
              Spacer(
                flex: 1,
              ),
              Button(
                text: "متابعة تسجيل الدخول",
                onTap: () {
                  controller.goToLogin();
                },
                hight: 50,
                size: 20,
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
