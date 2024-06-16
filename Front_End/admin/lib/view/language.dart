 
import 'package:admin/core/localization/changelocal.dart';
import 'package:admin/view/widget/language/languagebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 150,
              width: 150,
            ),
            const Divider(
              color: Colors.black,
              height: 150,
            ),
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: 20,
            ),
            LanguageButton(
              languagename: "2".tr,
              onPressed: () {
                controller.changelang("ar");
                Get.offNamed("login");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            LanguageButton(
              languagename: "13".tr,
              onPressed: () {
                controller.changelang("en");
                Get.offNamed("login");
              },
            ),
            const Divider(
              color: Colors.black,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
