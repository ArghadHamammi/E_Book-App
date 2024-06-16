import 'package:e_book/controller/auth/successsignup_controller.dart';
import 'package:e_book/view/widget/auth/buttonbody.dart';
import 'package:e_book/view/widget/auth/textbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUP extends StatelessWidget {
  const SuccessSignUP({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerimp controller = SuccessSignUpControllerimp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        centerTitle: true,
        title: Text("39".tr, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
                child: Icon(
              Icons.add_reaction_rounded,
              size: 200,
              color: Colors.amber,
            )),
            const SizedBox(height: 50),
            TextBody(text: "40".tr),
            const SizedBox(height: 300),
            SizedBox(
              width: double.infinity,
              child: ButtonBody(
                text: "15".tr,
                onPressed: () {
                  controller.goToPageLoging();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
