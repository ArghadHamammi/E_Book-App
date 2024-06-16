import 'package:e_book/controller/onboarding_controller.dart';
import 'package:e_book/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView<OnboardingControllerimp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
      margin: myServices.sharedPreferences.getString("lang") == "en"
          ? EdgeInsets.only(left: 200)
          : EdgeInsets.only(right: 200),
      child: IconButton(
          onPressed: () {
            controller.next();
          },
          icon: Icon(
            myServices.sharedPreferences.getString("lang") == "en"
                ? Icons.arrow_circle_right_outlined
                : Icons.arrow_circle_left_outlined,
            size: 50,
            color: Colors.black54,
          )),
    );
  }
}
