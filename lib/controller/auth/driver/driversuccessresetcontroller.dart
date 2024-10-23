import 'package:get/get.dart';

abstract class DSuccessResetController extends GetxController {
  goToLogin();
}

class DSuccessResetControllerImp extends DSuccessResetController {
  @override
  goToLogin() {
    Get.offAllNamed('dlogin');
  }
}
