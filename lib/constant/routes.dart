import 'package:get/get.dart';
import 'package:mechanice/core/middleware/middleware.dart';
import 'package:mechanice/view/screen/chat.dart';

import 'package:mechanice/view/screen/driver/auth/driverlogin.dart';
import 'package:mechanice/view/screen/driver/auth/driverregester.dart';
import 'package:mechanice/view/screen/driver/auth/forgetpass/driverforgetpass.dart';
import 'package:mechanice/view/screen/driver/auth/forgetpass/driverresetpass.dart';
import 'package:mechanice/view/screen/driver/auth/forgetpass/driversuccessreset.dart';
import 'package:mechanice/view/screen/driver/auth/driversuccessregester.dart';
import 'package:mechanice/view/screen/driver/d-location.dart';
import 'package:mechanice/view/screen/driver/d-traking.dart';
import 'package:mechanice/view/screen/driver/map.dart';
import 'package:mechanice/view/screen/driver/orders.dart/d-allorder.dart';
import 'package:mechanice/view/screen/driver/orders.dart/d-order.dart';
import 'package:mechanice/view/screen/driver/d-settings.dart';
import 'package:mechanice/view/screen/driver/storelocation.dart';

import 'package:mechanice/view/screen/mechanice/auth/forgetpass/forgetpass.dart';
import 'package:mechanice/view/screen/mechanice/auth/forgetpass/resetpass.dart';
import 'package:mechanice/view/screen/mechanice/auth/forgetpass/success.dart';
import 'package:mechanice/view/screen/mechanice/auth/successregester.dart';
import 'package:mechanice/view/screen/mechanice/home.dart';
import 'package:mechanice/view/screen/mechanice/addinfopage.dart';
import 'package:mechanice/view/screen/mechanice/location.dart';
import 'package:mechanice/view/screen/mechanice/preorderpage.dart';
import 'package:mechanice/view/screen/mechanice/servicetype.dart';
import 'package:mechanice/view/screen/mechanice/setting.dart';
import 'package:mechanice/view/screen/mechanice/orderlocation.dart';
import '../view/screen/driver/driverAllInfoPage.dart';
import '../view/screen/driver/driveronwayService.dart';
import '../view/screen/driver/driverServiceTypePage.dart';
import '../view/screen/driver/dcategory.dart';
import '../view/screen/mechanice/auth/login.dart';
import '../view/screen/mechanice/order.dart';
import '../view/screen/mechanice/auth/regesterpage.dart';
import '../view/screen/selectmethodpage.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SelectMethodePage(),
      middlewares: [Middleware()]),

//======================driver=============//

  GetPage(name: "/dregester", page: () => const DriverRegesterPage()),
  GetPage(name: "/dlogin", page: () => const DriverLoginPage()),
  GetPage(name: "/dforgetpass", page: () => const DForgetPass()),
  GetPage(name: "/order", page: () => DOrder()),
  GetPage(name: "/allorder", page: () => Allorder()),
  GetPage(name: "/dresetpass", page: () => const DReSetPass()),
  GetPage(name: "/dsuccess", page: () => const DSuccessReset()),
  GetPage(name: "/dsuccessregester", page: () => const DSuccessRegester()),
  GetPage(name: "/driverselect", page: () => const DriverCategoryPage()),
  GetPage(name: "/Onwayservice", page: () => const DOnWayService()),
  GetPage(name: "/servicetype", page: () => DServiceTypePage()),
  GetPage(name: "/Allinfo", page: () => const DAllInfoPage()),
  GetPage(name: "/dsetting", page: () => const DSettings()),
  GetPage(name: "/dlocation", page: () => DLocationPage()),
  GetPage(name: "/storelocation", page: () => StoreLocation()),
  GetPage(name: "/ordertraking", page: () => OrderTraking()),
  GetPage(name: "/map", page: () => MapPage()),
  GetPage(name: "/bot", page: () => BotPage()),

  //mechanice

  GetPage(
    name: "/login",
    page: () => const LoginPage(),
  ),

  // GetPage(name: "/info", page: () => const InfoPage()),
  GetPage(name: "/addinfo", page: () => const AddInformationPage()),
  GetPage(name: "/type", page: () => const ServiceTypePage()),
  GetPage(name: "/setting", page: () => const Settings()),
  // GetPage(name: "/no", page: () => const NoOnWayPage()),
  // GetPage(name: "/on", page: () => const OrderPage()),
  GetPage(name: "/regester", page: () => const RegesterPage()),

  GetPage(name: "/forgetpass", page: () => const ForgetPass()),
  GetPage(name: "/resetpass", page: () => const ReSetPass()),
  GetPage(name: "/success", page: () => const SuccessReset()),
  GetPage(name: "/successregester", page: () => const SuccessRegester()),
  GetPage(name: "/home", page: () => HomePage()),
  GetPage(name: "/orderpage", page: () => OrderPage()),
  GetPage(name: "/preorder", page: () => PreOrderPage()),
  GetPage(name: "/location", page: () => LocationPage()),
  GetPage(name: "/orderlocation", page: () => OrderLocation()),
];
