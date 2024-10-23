import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/mechanice/addinfocontroller.dart';

import '../../core/class/sizeconf.dart';

class StartTime extends StatefulWidget {
  StartTime({Key? key, required this.text}) : super(key: key);
  final String text;
  void Function(Object?)? onChanged;
  @override
  State<StartTime> createState() => _StartTimeState();
}

class _StartTimeState extends State<StartTime> {
  var selected;

  @override
  Widget build(BuildContext context) {
    AddInfocontrollerImp controller = Get.find();

    return Container(
      width: SizeConf.screenWidth! * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: orangeColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButton(
            icon: Icon(Icons.arrow_drop_down, color: blackColor),
            hint: Text(widget.text,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 18,
                )),
            dropdownColor: Colors.white,
            focusColor: orangeColor,
            style: TextStyle(color: blackColor),
            underline: SizedBox(),
            // isExpanded: true,
            items: [
              '9:00 AM',
              '10:00 AM',
              '11:00 AM',
              '12:00 PM',
              '1:00 PM',
              '2:00 PM',
              '3:00 PM',
              '4:00 PM',
              '5:00 PM',
            ]
                .map((e) => DropdownMenuItem(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text("$e"),
                        ],
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (val) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  selected = val!;
                  controller.addTime(selected);
                });
                // Add Your Code here.
              });
            },
            value: selected,
          ),
        ],
      ),
    );
  }
}

class EndTime extends StatefulWidget {
  EndTime({Key? key, required this.text}) : super(key: key);
  final String text;
  void Function(Object?)? onChanged;
  @override
  State<EndTime> createState() => _EndTimeState();
}

class _EndTimeState extends State<EndTime> {
  var selected;

  @override
  Widget build(BuildContext context) {
    AddInfocontrollerImp controller = Get.find();
    SizeConf().init(context);

    return Container(
      width: SizeConf.screenWidth! * 0.43,
      // width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: orangeColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButton(
            icon: Icon(Icons.arrow_drop_down, color: blackColor),
            hint: Text(widget.text,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 18,
                )),
            dropdownColor: Colors.white,
            focusColor: orangeColor,
            style: TextStyle(color: blackColor),
            underline: SizedBox(),
            // isExpanded: true,
            items: [
              '9:00 AM',
              '10:00 AM',
              '11:00 AM',
              '12:00 PM',
              '1:00 PM',
              '2:00 PM',
              '3:00 PM',
              '4:00 PM',
              '5:00 PM',
            ]
                .map((e) => DropdownMenuItem(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text("$e"),
                        ],
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (val) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  selected = val!;
                  controller.endTime(selected);
                });
              });
            },
            value: selected,
          ),
        ],
      ),
    );
  }
}
