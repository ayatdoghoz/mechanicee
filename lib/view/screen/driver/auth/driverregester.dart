import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/auth/driver/driverregestercontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/functions/validinput.dart';
import 'package:mechanice/view/widget/textformfeild/authtextfield.dart';
import 'package:mechanice/view/widget/button.dart';
import 'package:mechanice/view/widget/textbutton.dart';
import 'package:mechanice/view/widget/textformfeild/customtextfield.dart';

class DriverRegesterPage extends StatelessWidget {
  const DriverRegesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DRegesterControllerImp());
    return Scaffold(
        body: GetBuilder<DRegesterControllerImp>(
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
                              ' إنشاء حساب ',
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
                            CustomTextField(
                              valid: (val) {
                                return validInput(val!, 3, 30, 'username');
                              },
                              lable: "اسم المستخدم",
                              hight: 10,
                              hintText: "  الاسم",
                              mycontroller: controller.username,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              valid: (val) {
                                return validInput(val!, 10, 30, 'email');
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
                              valid: (val) {
                                return validInput(val!, 10, 30, 'phone');
                              },
                              mycontroller: controller.phone,
                              hight: 4,
                              lable: ":رقم الهاتف",
                              hintText: " 09xx xxx xxx",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextField(
                              valid: (val) {
                                return validInput(val!, 10, 30, 'password');
                              },
                              mycontroller: controller.pass,
                              hight: 10,
                              lable: "كلمة المرور",
                              hintText: "  *****************",
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Button(
                                size: 24,
                                hight: 60,
                                text: 'إنشاء الحساب',
                                width: double.infinity,
                                onTap: () {
                                  controller.goTodriververifiy();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonText(
                                text: 'لديك حساب بالفعل',
                                onpreesed: () {
                                  controller.goToLogin();
                                }),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}
