import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/services/services.dart';

class Middleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: "/addinfo");
    }
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: "/driverselect");
    }
    //mech
    if (myServices.sharedPreferences.getString("mstep") == "1") {
      return const RouteSettings(name: "home");
    }

    if (myServices.sharedPreferences.getString("mstep") == "2") {
      return const RouteSettings(name: "type");
    }
    return null;
  }
}
