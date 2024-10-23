import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/functions/upload.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/home.dart';

abstract class AddInfoController extends GetxController {
  getData();

  exit();
  addTime(String startTime);
  endTime(String Time);
  onway(String type);
  addLocation();
}

class AddInfocontrollerImp extends AddInfoController {
  late TextEditingController storename;
  late TextEditingController storephone;
  late TextEditingController disc;
  late TextEditingController ownername;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  InfoData infoData = InfoData(Get.find());
  List data = [];
  String? category_id;
  String? start;
  String? end;
  String? lat;
  String? long;
  String? onWay;
  File? file;
  late StatusRequest statusRequest = StatusRequest.none;
  camera() async {
    file = await imageUpload(ImageSource.camera);

    update();
  }

  gallery() async {
    file = await imageUpload(ImageSource.gallery);
    update();
  }

  getlocation() {
    lat = myServices.sharedPreferences.getString("lat");
    long = myServices.sharedPreferences.getString("long");
  }

  @override
  getData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.looding;
      update();

      var response = await infoData.addData(
          storename.text,
          ownername.text,
          storephone.text,
          disc.text,
          myServices.sharedPreferences.getString('id')!,
          category_id!,
          start!,
          end!,
          onWay!,
          lat!,
          long!,
          file!);

      print("=============================== Controller $response ");
      statusRequest = handelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (file == null) {
            // Permissions are denied forever, handle appropriately.
            return Get.snackbar("تنبيه", "يرجى إضافة صورة");
          }

          Get.offAllNamed('home');
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  initialData() {
    storename = TextEditingController();
    storephone = TextEditingController();
    disc = TextEditingController();
    ownername = TextEditingController();
    myServices.sharedPreferences.getString("username");
    category_id = Get.arguments["category_id"];
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  void dispos() {
    storename.dispose();
    storephone.dispose();
    ownername.dispose();
    disc.dispose();
  }

  @override
  exit() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed("login");
  }

  @override
  addTime(startTime) {
    start = startTime;
  }

  @override
  endTime(Time) {
    end = Time;
  }

  @override
  onway(type) {
    type == "متوفرة" ? onWay = "1" : onWay = "0";
  }

  @override
  addLocation() {
    Get.toNamed("location");
  }
}
