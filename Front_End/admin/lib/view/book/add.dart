import 'package:admin/controller/books/bookadd_controller.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/customedropdown.dart';
import 'package:admin/core/shared/textform.dart';
import 'package:admin/view/widget/auth/buttonbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookadd extends StatelessWidget {
  const Bookadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookAddControllerimp());
    return GetBuilder<BookAddControllerimp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("99".tr),
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
                labeltext: "107".tr,
                hinttext: "107".tr,
                myicon: Icons.title,
                mycontroller: controller.newtitle,
                valid: (p0) {
                  return validInput(p0!, 2, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "108".tr,
                hinttext: "108".tr,
                myicon: Icons.person,
                mycontroller: controller.newauther,
                valid: (p0) {
                  return validInput(p0!, 2, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "110".tr,
                hinttext: "110".tr,
                myicon: Icons.date_range,
                mycontroller: controller.newdate,
                valid: (p0) {
                  return validInput(p0!, 3, 30, "");
                },
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "109".tr,
                hinttext: "109".tr,
                myicon: Icons.link,
                mycontroller: controller.neewlink,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.url,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "111".tr,
                hinttext: "111".tr,
                myicon: Icons.home_filled,
                mycontroller: controller.newpublisher,
                valid: (p0) {
                  return validInput(p0!, 2, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomeDropDown(
                  myicon: Icons.category,
                  title: "112".tr,
                  listdata: controller.selectganre,
                  selectefname: controller.dropname,
                  selectedid: controller.dropid),
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
