import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/driver/botcontroller.dart';
import 'package:mechanice/view/widget/textformfeild/customtextfield.dart';

import '../../constant/constant.dart';
import '../../core/class/hanelingdataview.dart';
import '../../core/class/statusrequest.dart';
import '../widget/button.dart';

class BotPage extends StatelessWidget {
  final BotController botController = Get.put(BotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
          "ميكانيكي",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("مرحبا بك, المكيانيكي الذكي جاهز لتقديم المساعدة",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
            SizedBox(height: 50),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: botController.question,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: '  اكتب مشكلة سيارتك ',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: orangeColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: orangeColor,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Button(
              hight: 50,
              width: 100,
              size: 20,
              text: 'إرسال',
              onTap: () {
                botController.getData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
