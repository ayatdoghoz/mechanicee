import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/auth/driver/driversuccessresetcontroller.dart';
import 'package:mechanice/view/widget/button.dart';

class DSuccessReset extends StatelessWidget {
  const DSuccessReset({super.key});

  @override
  Widget build(BuildContext context) {
    DSuccessResetControllerImp controller =
        Get.put(DSuccessResetControllerImp());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                'تم التحقق بنجاح ',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              const Icon(
                Icons.verified_user_outlined,
                size: 150,
              ),
              const Spacer(
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
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
