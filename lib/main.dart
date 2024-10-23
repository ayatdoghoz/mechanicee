import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/binding/initialbinding.dart';
import 'package:mechanice/constant/routes.dart';
import 'package:mechanice/core/localization/local.dart';
import 'package:mechanice/core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      initialBinding: InitialBindings(),
      getPages: routes,
      title: 'ميكانيكي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'El Messiri'),
      initialRoute: "/",
    );
  }
}
