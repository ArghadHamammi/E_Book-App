import 'package:e_book/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../data/datasource/static/static.dart';

class DotContlloer extends StatelessWidget {
  const DotContlloer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerimp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardinfList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 1000),
                    width: controller.currentpage == index ? 60 : 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  )),
        ],
      ),
    );
  }
}
