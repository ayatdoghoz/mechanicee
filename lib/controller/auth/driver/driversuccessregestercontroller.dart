import 'package:get/get.dart';

abstract class DSuccessRegesterController extends GetxController {
  goToLogin();
}

class DSuccessRegesterControllerImp extends DSuccessRegesterController {
  @override
  goToLogin() {
    Get.offAllNamed('dlogin');
  }
}
