import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/mechanice/servicetypecontroller.dart';
import 'package:mechanice/data/model/category.dart';

import 'servicebuttton.dart';

class ServiceTypy extends GetView<ServiceTypeControllerImp> {
  const ServiceTypy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.data.length,
        // gridDelegate:
        //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, index) {
          return ServiceTypyCategoreis(
            i: index,
            categorymodel: Categorymodel.fromJson(controller.data[index]),
          );
        });
  }
}

class ServiceTypyCategoreis extends GetView<ServiceTypeControllerImp> {
  const ServiceTypyCategoreis({
    super.key,
    required this.categorymodel,
    required this.i,
  });
  final Categorymodel categorymodel;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return ServiceButton(
      text: "${categorymodel.name}",
      onTap: () {
        controller.goToAddInfo(controller.data[i!]["category_id"].toString());
      },
    );
  }
}
