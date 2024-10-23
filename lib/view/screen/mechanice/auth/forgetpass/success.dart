import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/auth/mechanicee/successresetcontroller.dart';
import 'package:mechanice/view/widget/button.dart';

class SuccessReset extends StatelessWidget {
  const SuccessReset({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetControllerImp controller = Get.put(SuccessResetControllerImp());

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
