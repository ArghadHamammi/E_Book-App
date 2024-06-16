import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "41".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "42".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "43".tr;
    }
  }
  if (type == "password") {
    if (GetUtils.isNull(val)) {
      return "47".tr;
    }
  }
  if (val.isEmpty) {
    return "46".tr;
    
  }
  if (val.length < min) {
    return "44".tr ;
    
  }
  if (val.length > max) {
    return "45 $max".tr;
  }
}
