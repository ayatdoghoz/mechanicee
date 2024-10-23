import 'package:get/get.dart';

abstract class SuccessResetController extends GetxController {
  goToLogin();
}

class SuccessResetControllerImp extends SuccessResetController {
  @override
  goToLogin() {
    Get.offAllNamed('login');
  }
}
