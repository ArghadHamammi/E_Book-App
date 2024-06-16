import 'package:e_book/core/function/validinput.dart';
import 'package:e_book/view/widget/auth/buttonbody.dart';
import 'package:e_book/view/widget/auth/logoimage.dart';
import 'package:e_book/view/widget/auth/texttitle.dart';
import 'package:e_book/view/widget/auth/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/function/alertexitapp.dart';
import '../../widget/auth/textbody.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerimp controller = Get.put(LoginControllerimp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          centerTitle: true,
          title: Text("6".tr, style: Theme.of(context).textTheme.headlineLarge),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: alertexitapp,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoImage(),
                    const SizedBox(height: 30),
                    TextTitle(text: "7".tr),
                    const SizedBox(height: 15),
                    TextBody(text: "8".tr),
                    const SizedBox(height: 65),
                    TextFormFieldd(
                        type: TextInputType.emailAddress,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        labeltext: "9".tr,
                        hinttext: "10".tr,
                        myicon: Icons.email_outlined),
                    const SizedBox(height: 40),
                    GetBuilder<LoginControllerimp>(
                      builder: (controller) => TextFormFieldd(
                          onTapicon: () {
                            controller.showpassword();
                          },
                          visib: controller.isshowpass,
                          type: TextInputType.visiblePassword,
                          valid: (val) {
                            return validInput(val!, 8, 25, "password");
                          },
                          mycontroller: controller.password,
                          labeltext: "11".tr,
                          hinttext: "12".tr,
                          myicon: Icons.lock_clock_outlined),
                    ),
                    const SizedBox(height: 20),
                    ButtonBody(
                      text: "15".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(height: 20),
                    TextSignUp(
                      text: "16".tr,
                      texttwo: "17".tr,
                      onTap: () {
                        controller.goToSignUp();
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}
