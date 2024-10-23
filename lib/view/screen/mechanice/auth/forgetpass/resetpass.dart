import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/auth/mechanicee/resetcontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/functions/validinput.dart';
import 'package:mechanice/view/widget/textformfeild/authtextfield.dart';
import 'package:mechanice/view/widget/button.dart';

class ReSetPass extends StatelessWidget {
  const ReSetPass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetControllerImp());
    return Scaffold(
        body: GetBuilder<ResetControllerImp>(
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
                              'إعادة تعيين كلمة السر',
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
                                return validInput(val!, 10, 30, 'password');
                              },
                              mycontroller: controller.pass,
                              lable: 'أدخال كلمة السر الجديدة',
                              hintText: "  ****************",
                              hight: 10,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            AuthTextField(
                              valid: (val) {
                                return validInput(val!, 10, 30, 'password');
                              },
                              mycontroller: controller.repass,
                              lable: 'إعادة إدخال كلمة السر الجديدة',
                              hintText: "  ****************",
                              hight: 10,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Button(
                                size: 24,
                                hight: 60,
                                text: 'حقظ التغيير',
                                width: double.infinity,
                                onTap: () {
                                  controller.goToSuccessReset();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}
