import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/auth/driver/driverlogincontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/functions/validinput.dart';

import 'package:mechanice/view/widget/button.dart';
import 'package:mechanice/view/widget/textbutton.dart';
import 'package:mechanice/view/widget/textformfeild/authtextfield.dart';

class DriverLoginPage extends StatelessWidget {
  const DriverLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandelingDataViewRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            const Text(
                              "ميكانيكي",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'تسجيل الدخول',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Color(0x7fffffff),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              valid: (val) {
                                return validInput(val!, 5, 50, 'email');
                              },
                              mycontroller: controller.email,
                              lable: "البريد الالكتروني",
                              hintText: "  mechanice@gmail.com",
                              hight: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              obscureText: true,
                              valid: (val) {
                                return validInput(val!, 10, 50, 'password');
                              },
                              mycontroller: controller.pass,
                              hight: 10,
                              lable: "كلمة المرور",
                              hintText: "  *****************",
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Button(
                                size: 24,
                                hight: 60,
                                text: 'تسجيل',
                                width: double.infinity,
                                onTap: () {
                                  controller.login();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonText(
                                text: 'هل نسيت كلمة السر',
                                onpreesed: () {
                                  controller.goToForgetPass();
                                }),
                            ButtonText(
                                text: 'ليس لديك حساب',
                                onpreesed: () {
                                  controller.goToRegester();
                                }),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}
