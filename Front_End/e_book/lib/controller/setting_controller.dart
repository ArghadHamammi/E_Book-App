import 'package:e_book/core/constant/theme.dart';
import 'package:e_book/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logout();
}

class SettingControllerimp extends SettingController {
  MyServices myServices = Get.find();

  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic(
        "users${myServices.sharedPreferences.getString("user_id")}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed("login");
  }

  // ThemeData apptheme = themeenglish;
  // Locale? language;
  // chane() {
  //   String? sharedlang = myServices.sharedPreferences.getString("lang");
  //   if (sharedlang == "ar") {
  //     language = const Locale("ar");
  //     apptheme = themearabic;
  //   } else if (sharedlang == "en") {
  //     language = const Locale("en");
  //     apptheme = themeenglish;
  //   } else {
  //     language = Locale(Get.deviceLocale!.languageCode);
  //     apptheme = themeenglish;
  //   }
  // }
  Locale? language;

  ThemeData apptheme = themeenglish;
  changelangen(String languageCode) {
    Locale local = Locale(languageCode);
    //احفظ هنا الاختيار تبعي للغة المستخدمة باول صفحة
    myServices.sharedPreferences.setString("lang", languageCode);
    apptheme = languageCode == "ar" ? themearabic : themeenglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(local);
    update();
  }

  changelangar(String languageCode) {
    Locale local = Locale(languageCode);
    //احفظ هنا الاختيار تبعي للغة المستخدمة باول صفحة
    myServices.sharedPreferences.setString("lang", languageCode);
    apptheme = languageCode == "ar" ? themearabic : themeenglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(local);
    update();
  }

  alertchangelan() {
    Get.defaultDialog(title: "66".tr, middleText: "1".tr, actions: [
      ElevatedButton(
          onPressed: () {
            changelangar("ar");
              Get.back();
          },
          child: Text("العربية")),
      ElevatedButton(
          onPressed: () {
            changelangen("en");
              Get.back();
          },
          child: Text("English")),
    ]);
    update();
  }

  alertexitapp() {
    Get.defaultDialog(title: "48".tr, middleText: "100".tr, actions: [
      ElevatedButton(
          onPressed: () {
            logout();
          },
          child: Text("50".tr)),
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("51".tr)),
    ]);
  }
}
