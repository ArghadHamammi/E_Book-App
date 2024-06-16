import 'package:admin/controller/books/bookedit_controllrt.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/customedropdown.dart';
import 'package:admin/core/shared/textform.dart';
import 'package:admin/view/widget/auth/buttonbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookEdit extends StatelessWidget {
  const BookEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookEditimp());
    return GetBuilder<BookEditimp>(
      builder: (BookEditimp controller) => Scaffold(
          appBar: AppBar(
            title: Text("106".tr),
            centerTitle: true,
            backgroundColor: Colors.amber.withOpacity(0.7),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text(controller.title),
              Text(controller.auther),
              Text(controller.link),
              Text(controller.publisher),
              Text(controller.date),
              Image.network("$linkBookimage/${controller.image}"),
              const SizedBox(
                height: 30,
              ),
              TextFormGeneral(
                labeltext: "107".tr,
                hinttext: "107".tr,
                myicon: Icons.title,
                mycontroller: controller.newtitle,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
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
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "109".tr,
                hinttext: "109".tr,
                myicon: Icons.date_range,
                mycontroller: controller.newdate,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormGeneral(
                labeltext: "110".tr,
                hinttext: "110".tr,
                myicon: Icons.link,
                mycontroller: controller.newlink,
                valid: (p0) {
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
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
                  return validInput(p0!, 5, 30, "");
                },
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 35,
              ),
              CustomeDropDown(
                  myicon: Icons.category,
                  title: "112".tr,
                  listdata: controller.selectganre,
                  selectefname: controller.dropname,
                  selectedid: controller.dropid),
              const SizedBox(
                height: 35,
              ),
              ButtonBody(
                text: "106".tr,
                onPressed: () {
                  controller.editdata();
                },
              ),
            ],
          )),
    );
  }
}
