import 'package:admin/controller/genre/genreedit_controllrt.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/textform.dart';
import 'package:admin/view/widget/auth/buttonbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreEdit extends StatelessWidget {
  const GenreEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GenreditControllerimp());
    return GetBuilder<GenreditControllerimp>(
      builder: (GenreditControllerimp controller) => Scaffold(
          appBar: AppBar(
            title: Text("97".tr),
            centerTitle: true,
            backgroundColor: Colors.amber.withOpacity(0.7),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text(controller.namegenre),
              Text(controller.namegenrear),
              Image.network("$linkcategoriesimage/${controller.image}"),
              const SizedBox(
                height: 30,
              ),
              TextFormGeneral(
                labeltext: "101".tr,
                hinttext: "102".tr,
                myicon: Icons.category,
                mycontroller: controller.newname,
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
                mycontroller: controller.newnamear,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
              ),
               ButtonBody(
                text: "105".tr,
                onPressed: () {
                  controller.editdata();
                },
              ),
            ],
          )),
    );
  }
}
