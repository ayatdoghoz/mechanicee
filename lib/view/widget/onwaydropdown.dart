import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';

import '../../controller/mechanice/addinfocontroller.dart';

class OnWayDropDown extends StatefulWidget {
  OnWayDropDown({Key? key}) : super(key: key);

  @override
  State<OnWayDropDown> createState() => _OnWayDropDownState();
}

class _OnWayDropDownState extends State<OnWayDropDown> {
  var selected;

  @override
  Widget build(BuildContext context) {
    AddInfocontrollerImp controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // xn5 (4:21)

          child: const Text(
            ':خدمة على الطريق',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.565,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: orangeColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                icon: const Icon(Icons.arrow_drop_down, color: blackColor),
                hint: const Text("خدمة على الطريق",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 18,
                    )),
                dropdownColor: Colors.white,
                focusColor: orangeColor,
                style: const TextStyle(color: blackColor),
                underline: const SizedBox(),
                // isExpanded: true,
                items: [
                  "متوفرة",
                  "غير متوفرة",
                ]
                    .map((e) => DropdownMenuItem(
                          alignment: Alignment.centerRight,
                          value: e, // توجيه النص إلى اليمين
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                  Icons.arrow_back_ios), // تغيير ترتيب العناصر
                              Text("$e"),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      selected = val!;
                      controller.onway(selected);
                    });
                  });
                },
                value: selected,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
