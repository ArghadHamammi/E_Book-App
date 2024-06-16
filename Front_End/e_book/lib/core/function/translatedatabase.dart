import 'package:e_book/core/services/services.dart';
import 'package:get/get.dart';

translatdatabase(ar, en) {
  MyServices myservices = Get.find();
  if (myservices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
