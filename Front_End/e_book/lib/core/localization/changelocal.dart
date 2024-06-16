import 'package:e_book/core/constant/theme.dart';
import 'package:e_book/core/function/notification.dart';
import 'package:e_book/core/services/services.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData apptheme = themeenglish;
  changelang(String languageCode) {
    Locale local = Locale(languageCode);
    //احفظ هنا الاختيار تبعي للغة المستخدمة باول صفحة
    myServices.sharedPreferences.setString("lang", languageCode);
    apptheme = languageCode == "ar" ? themearabic : themeenglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    premmission();
    print("123456789963649");
    fcm();
    String? sharedlang = myServices.sharedPreferences.getString("lang");
    if (sharedlang == "ar") {
      language = const Locale("ar");
      apptheme = themearabic;
    } else if (sharedlang == "en") {
      language = const Locale("en");
      apptheme = themeenglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeenglish;
    }
    // gettoken();

    super.onInit();
  }

  // gettoken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   return token;
  // }
}
