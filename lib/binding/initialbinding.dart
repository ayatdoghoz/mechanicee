import 'package:get/get.dart';
import 'package:mechanice/core/class/crud.dart';
import 'package:mechanice/data/datasource/remote/botdata.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(BotCrud());
  }
}
