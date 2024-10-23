// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mechanice/constant/constant.dart';
// import 'package:mechanice/controller/mechanice/infoview.dart';
// import 'package:mechanice/data/model/store.dart';
// import 'package:mechanice/view/widget/button.dart';

// class AllInfoView extends StatelessWidget {
//   AllInfoView({super.key});
//   InfoViewControllerImp controller = Get.put(InfoViewControllerImp());
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (context, index) {
//       return AllInfo(
//         storeModel: controller.data[index],
//       );
//     });
//   }
// }

// class AllInfo extends StatelessWidget {
//   const AllInfo({super.key, required this.storeModel});
//   final Store storeModel;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Container(
//               height: 90,
//               width: 90,
//               child: const CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage('assets/images/face-1.png'),
//               ),
//             ),
//             const Spacer(
//               flex: 1,
//             ),
//             Text(
//               storeModel.storename!,
//               style: const TextStyle(
//                   color: greyColor, fontSize: 30, fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Container(
//           width: double.infinity,
//           height: 350,
//           decoration: BoxDecoration(
//             border: Border.all(color: orangeColor),
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(18),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(18),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   ':رقم الهاتف\n ${storeModel.storephone!} \n',
//                   style: TextStyle(color: blackColor, fontSize: 20),
//                   textAlign: TextAlign.right,
//                 ),
//                 Text(
//                   ":ساعات الدوام",
//                   style: TextStyle(color: blackColor, fontSize: 20),
//                   textAlign: TextAlign.right,
//                 ),
//                 Text(
//                   "${storeModel.start}  ->  ${storeModel.end} \n",
//                   style: TextStyle(color: blackColor, fontSize: 20),
//                   textAlign: TextAlign.right,
//                 ),
//                 Text(
//                   ':الوصف\n ${storeModel.disc} \n',
//                   style: TextStyle(color: blackColor, fontSize: 20),
//                   textAlign: TextAlign.right,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 40,
//         ),
//         Button(
//           text: "تتبع الموقع",
//           onTap: () {},
//           size: 20,
//           hight: 50,
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Button(
//           text: 'طلب خدمة على الطريق',
//           onTap: () {},
//           size: 20,
//           hight: 50,
//         ),
//       ],
//     );
//   }
// }
