import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/controller/driver/catrgorycontroller.dart';
import 'package:mechanice/data/model/category.dart';

import 'servicebuttton.dart';

class Category extends GetView<CategoryControllerImp> {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.data.length + 1,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          if (index == controller.data.length) {
            return ServiceButton(
              text: "الميكانيكي الذكي",
              onTap: () {
                controller.goToBot();
              },
            );
          } else {
            return Categoreis(
              i: index,
              categorymodel: Categorymodel.fromJson(controller.data[index]),
            );
          }
        });
  }
}

class Categoreis extends GetView<CategoryControllerImp> {
  const Categoreis({
    Key? key,
    required this.categorymodel,
    required this.i,
  }) : super(key: key);

  final Categorymodel categorymodel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return ServiceButton(
      text: "${categorymodel.name}",
      onTap: () {
        controller.goToItems(controller.data[i!]["category_id"].toString());
      },
    );
  }
}
