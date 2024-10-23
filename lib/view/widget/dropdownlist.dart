// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mechanice/constant/constant.dart';
// import 'package:mechanice/controller/mechanice/addinfocontroller.dart';
// import 'package:mechanice/controller/mechanice/categoryDropDowncontroller.dart';

// class DropDown extends StatefulWidget {
//   DropDown({Key? key}) : super(key: key);

//   @override
//   State<DropDown> createState() => _DropDownState();
// }

// class _DropDownState extends State<DropDown> {
//   var selected;

//   ServiceTypeControllerImp categoryController =
//       Get.put(ServiceTypeControllerImp());

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> categoryItems = categoryController.data;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Container(
//           child: Text(
//             ':الخدمة المتوفرة',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               height: 1.565,
//             ),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             border: Border.all(color: orangeColor),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               DropdownButton(
//                 icon: Icon(Icons.arrow_drop_down, color: blackColor),
//                 hint: Text(
//                   "حدد نوع الخدمة المتوفرة",
//                   style: TextStyle(
//                     color: blackColor,
//                     fontSize: 18,
//                   ),
//                 ),
//                 dropdownColor: Colors.white,
//                 focusColor: orangeColor,
//                 style: TextStyle(color: blackColor),
//                 underline: SizedBox(),
//                 items:
//                     categoryItems.map<DropdownMenuItem<dynamic>>((dynamic e) {
//                   return DropdownMenuItem<dynamic>(
//                     alignment: Alignment.centerRight,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(Icons.arrow_back_ios),
//                         Text(e['name']),
//                       ],
//                     ),
//                     value: e,
//                   );
//                 }).toList(),
//                 onChanged: (val) {
//                   setState(() {
//                     selected = val!;
//                   });
//                 },
//                 value: selected,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
