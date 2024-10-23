// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:mechanicee/constant/constant.dart';
// import 'package:mechanicee/controller/auth/driver/driververifiycontrollerregester.dart';

// import 'package:mechanicee/view/widget/textbutton.dart';

// class DVerfiyCodeRegester extends StatelessWidget {
//   const DVerfiyCodeRegester({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DVerifiyRegesterControllerImp controller =
//         Get.put(DVerifiyRegesterControllerImp());
//     return Scaffold(
//         body: ListView(children: [
//       Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 120,
//               ),
//               const Text(
//                 "ميكانيكي",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               const Text(
//                 'قم بإدخال رمز التحقق الذي تم ارساله على البريد الخاص بك',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0x7fffffff),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               OtpTextField(
//                 numberOfFields: 5,
//                 fieldWidth: 50.0,
//                 focusedBorderColor: orangeColor,
//                 textStyle: const TextStyle(fontSize: 18),
//                 borderRadius: BorderRadius.circular(18),
//                 fillColor: Colors.white,
//                 showFieldAsBox: true,
//                 onCodeChanged: (String code) {},
//                 onSubmit: (String verificationCode) {
//                   controller.goToSuccessRegester();
//                 },
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               ButtonText(text: 'إعادة إرسال الرمز', onpreesed: () {}),
//             ],
//           ),
//         ),
//       ),
//     ]));
//   }
// }
