//شاشة الدخول للتطبيق
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/dotcontrollers.dart';
import '../widget/onboarding/sliderinfo.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerimp());
    return const Scaffold(
        body: SafeArea(
      child: Column(children: [
        SizedBox(height: 20),
        Expanded(
          flex: 3,
          child: SliderInfo(),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                DotContlloer(),
                SizedBox(height: 20),
                CustomButton(),
              ],
            )),
      ]),
    ));
  }
}
