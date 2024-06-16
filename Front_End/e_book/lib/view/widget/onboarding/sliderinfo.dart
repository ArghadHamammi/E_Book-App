import 'package:e_book/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../data/datasource/static/static.dart';

class SliderInfo extends GetView<OnboardingControllerimp> {
  const SliderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.6),
        border: Border.symmetric(),
        shape: BoxShape.circle, // جعل الـ container دائريًا
        // border: Border.all(width: 2.0, color: Colors.black),
        // shape: BoxShape.circle, // جعل الـ container دائريًا
      ),
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onpagechane(value);
        },
        itemCount: onBoardinfList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Text(
              onBoardinfList[index].title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    onBoardinfList[index].image!,
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber.withOpacity(0.19),
                  ),
                  // child: Text(
                  //     "${controller.books[index]['Book_name']}"),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardinfList[index].body!,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
