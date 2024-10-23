import 'package:get/get.dart';

abstract class SuccessRegesterController extends GetxController {
  goToLogin();
}

class SuccessRegesterControllerImp extends SuccessRegesterController {
  @override
  goToLogin() {
    Get.offAllNamed('login');
  }
}
