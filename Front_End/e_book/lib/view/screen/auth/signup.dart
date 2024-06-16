import 'package:e_book/core/function/alertexitapp.dart';
import 'package:e_book/core/function/validinput.dart';
import 'package:e_book/view/widget/auth/buttonbody.dart';
import 'package:e_book/view/widget/auth/textsignup.dart';
import 'package:e_book/view/widget/auth/texttitle.dart';
import 'package:e_book/view/widget/auth/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../widget/auth/textbody.dart';

class SignUp extends StatelessWidget {
   const  SignUp({super.key});
 

  @override
  Widget build(BuildContext context) {
    SignUpControllerimp controller = Get.put(SignUpControllerimp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        centerTitle: true,
        title: Text("22".tr, style: Theme.of(context).textTheme.headlineLarge),
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
                const SizedBox(height: 20),
                TextTitle(text: "23".tr),
            
                TextBody(text: "24".tr),
                const SizedBox(height: 65),
                TextFormFieldd(
                    type: TextInputType.name,
                    valid: (val) {
                      return validInput(val!, 1, 20, "username");
                    },
                    mycontroller: controller.username,
                    labeltext: "18".tr,
                    hinttext: "19".tr,
                    myicon: Icons.person_2_outlined),
                const SizedBox(height: 25),
                TextFormFieldd(
                    type: TextInputType.emailAddress,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    mycontroller: controller.email,
                    labeltext: "9".tr,
                    hinttext: "10".tr,
                    myicon: Icons.email_outlined),
                const SizedBox(height: 25),
                TextFormFieldd(
                    type: TextInputType.number,
                    valid: (val) {
                      return validInput(val!, 9, 20, "phone");
                    },
                    mycontroller: controller.phone,
                    labeltext: "20".tr,
                    hinttext: "21".tr,
                    myicon: Icons.phone),
                const SizedBox(height: 25),
                GetBuilder<SignUpControllerimp>(
                    builder: (controller) => TextFormFieldd(
                        visib: controller.isshowpass,
                        onTapicon: () {
                          controller.showpassword();
                        },
                        type: TextInputType.visiblePassword,
                        valid: (val) {
                          return validInput(val!, 8, 25, "password");
                        },
                        mycontroller: controller.password,
                        labeltext: "11".tr,
                        hinttext: "12".tr,
                        myicon: Icons.lock_clock_outlined)),
                const SizedBox(height: 25),
                ButtonBody(
                  text: "22".tr,
                  onPressed: () {
                    controller.signup();
                  },
                ),
                const SizedBox(height: 10),
                TextSignUp(
                  text: "25".tr,
                  texttwo: "15".tr,
                  onTap: () {
                    controller.goToLogin();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
