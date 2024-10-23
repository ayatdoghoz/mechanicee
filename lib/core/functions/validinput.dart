import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "البريد غير صحيح";
    }
  }

  if (val.length < min) {
    return " لا يمكن ان يكون اقل من  $min";
  }
  if (val.length > max) {
    return " لا يمكن ان يكون اكثر من $max";
  }
  if (val.isEmpty) {
    return " لا يمكن ان يكون فارغ";
  }
}
