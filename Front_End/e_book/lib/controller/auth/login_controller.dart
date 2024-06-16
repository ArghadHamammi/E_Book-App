import 'package:e_book/core/class/crud.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:e_book/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerimp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpass = true;
  Crud crud = Crud();
  bool isloading = false;
  loginapi() async {
    var response = await crud.posrRequest(linkloging, {
      "users_email": email.text,
      "users_password": password.text,
    });
    if (response['status'] == "success") {
        myServices.sharedPreferences.setString(
        "users_id",response['data']['users_id'].toString()
      );
      myServices.sharedPreferences
          .setString("users_name", response['data']['users_name']);
      myServices.sharedPreferences
          .setString("users_email", response['data']['users_email']);
      myServices.sharedPreferences
          .setString("users_phone", response['data']['users_phone']);
      myServices.sharedPreferences.setString("step", "2");
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users${myServices.sharedPreferences.getString("user_id")}");
      Get.toNamed("/homepage");
    } else {
      Get.defaultDialog(title: "52".tr, middleText: "55".tr, actions: [
        TextButton(
            onPressed: () {
              
              Get.back();
            },
            child: Text("54".tr))
      ]);
    }
  }

  showpassword() {
    isshowpass = isshowpass == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      await loginapi();
    } else {
      print("not valif");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed("/signup");
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      //String? token = value;
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
