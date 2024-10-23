import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';

import 'package:mechanice/controller/mechanice/addinfocontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/class/sizeconf.dart';
import 'package:mechanice/core/functions/validinput.dart';

import 'package:mechanice/view/widget/button.dart';

import 'package:mechanice/view/widget/onwaydropdown.dart';
import 'package:mechanice/view/widget/textbutton.dart';
import 'package:mechanice/view/widget/textformfeild/authtextfield.dart';

import 'package:mechanice/view/widget/textformfeild/customtextfield.dart';
import 'package:mechanice/view/widget/time.dart';

class AddInformationPage extends StatelessWidget {
  const AddInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    AddInfocontrollerImp controller = Get.put(AddInfocontrollerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app_rounded,
              size: 30,
              color: Colors.white,
              fill: 0.3,
            ),
            onPressed: () {
              controller.exit();
            },
          ),
          title: const Text(
            "ميكانيكي",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<AddInfocontrollerImp>(
            builder: (controller) => HandelingDataViewRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: ListView(children: [
                      Column(
                        children: [
                          Stack(children: [
                            controller.file != null
                                ? Container(
                                    height: 140,
                                    width: 140,
                                    child: CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            FileImage(controller.file!)),
                                  )
                                : Container(
                                    height: 140,
                                    width: 140,
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          'assets/images/images.png'),
                                    ),
                                  ),
                            Positioned(
                              bottom: -1,
                              left: -15,
                              right: 70,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Container(
                                          width: double.infinity,
                                          height: 150,
                                          child: Column(children: [
                                            const Text(
                                              "قم بإضافة صورة",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: orangeColor),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  controller.camera();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: const Text(
                                                    "الكاميرا",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () {
                                                  controller.gallery();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: const Text(
                                                    " صورة من المعرض",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ])));
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.camera_enhance,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            valid: (val) {
                              return validInput(val!, 3, 30, 'name');
                            },
                            hight: 4,
                            lable: ":اسم المحل",
                            hintText: "ميكانيك السعادة  ",
                            mycontroller: controller.storename,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthTextField(
                              valid: (val) {
                                return validInput(val!, 10, 30, 'phone');
                              },
                              lable: ':رقم الهاتف',
                              hight: 4,
                              mycontroller: controller.storephone),
                          const SizedBox(
                            height: 10,
                          ),
                          // DropDown(),
                          const SizedBox(
                            height: 10,
                          ),
                          OnWayDropDown(),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                ':أوقات الدوام',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 1.565,
                                ),
                              ),
                              Row(
                                children: [
                                  EndTime(text: "إلى الساعة"),
                                  const Spacer(),
                                  StartTime(text: 'من الساعة'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.location_on),
                                ButtonText(
                                    onpreesed: () {
                                      controller.addLocation();
                                    },
                                    text: 'اضغط لتحديد الموقع'),
                                const Text(
                                  ':الموقع',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ]),
                          CustomTextField(
                            mycontroller: controller.disc,
                            valid: (val) {
                              return validInput(val!, 10, 400, 'disc');
                            },
                            lable: ':الوصف',
                            hintText: 'اضف بعض الوصف',
                            hight: 30,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Button(
                              size: 24,
                              hight: 60,
                              text: 'حفظ المعلومات',
                              onTap: () {
                                controller.getlocation();
                                if (controller.file == null ||
                                    controller.start == null ||
                                    controller.end == null ||
                                    controller.lat == null ||
                                    controller.long == null ||
                                    controller.onWay == null) {
                                  Get.defaultDialog(
                                      title: "تنبيه",
                                      middleText: 'يرحى إدخال كل المعلومات');
                                } else {
                                  controller.getData();
                                }
                              })
                        ],
                      ),
                    ]),
                  ),
                ))));
  }
}
