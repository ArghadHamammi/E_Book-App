import 'package:admin/controller/genre/genreadd_controller.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/textform.dart';
import 'package:admin/view/widget/auth/buttonbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreAdd extends StatelessWidget {
  const GenreAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GenreAddControllerimp());
    return GetBuilder<GenreAddControllerimp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("97".tr),
          centerTitle: true,
          backgroundColor: Colors.amber.withOpacity(0.7),
        ),
        body: Form(
          key: controller.formState,
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormGeneral(
                labeltext: "101".tr,
                hinttext: "102".tr,
                myicon: Icons.category,
                mycontroller: controller.name,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "103".tr,
                hinttext: "102".tr,
                myicon: Icons.category,
                mycontroller: controller.namear,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: MaterialButton(
                  color: Colors.amber[100],
                  onPressed: () {
                    controller.choonseimage();
                  },
                  child: Text("104".tr),
                ),
              ),
              if (controller.file != null) Image.file(controller.file!),
              ButtonBody(
                text: "105".tr,
                onPressed: () {
                  controller.addDataa();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
