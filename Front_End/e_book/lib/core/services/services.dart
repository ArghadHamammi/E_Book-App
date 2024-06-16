// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
