import 'package:e_book/core/class/crud.dart';
import 'package:e_book/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
}

class SignUpControllerimp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  bool isshowpass = true;

  Crud crud = Crud();
  signUpapi() async {
    var response = await crud.posrRequest(linksignup, {
      "users_name": username.text,
      "users_email": email.text,
      "users_phone": phone.text,
      "users_password": password.text,
    });
    if (response['status'] == 'success') {
      Get.offNamed("/successsignup");
      Get.delete<SignUpControllerimp>();
    } else {
      Get.defaultDialog(title: "52".tr, middleText: "53".tr, actions: [
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
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      await signUpapi();
    } else {}
  }

  @override
  goToLogin() {
    Get.offNamed("login");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
