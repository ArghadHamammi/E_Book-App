import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
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
      "admins_email": email.text,
      "admins_password": password.text,
    });
    if (response['status'] == "success") {
      myServices.sharedPreferences
          .setString("users_name", response['data']['admins_name']);
      myServices.sharedPreferences
          .setString("users_email", response['data']['admins_email']);

      myServices.sharedPreferences.setString("step", "2");

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
  void onInit() {
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
