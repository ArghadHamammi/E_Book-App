import 'dart:io';

import 'package:admin/controller/genre/genreview_controller.dart';
import 'package:admin/core/class/crud.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/genredata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class GenreAddController extends GetxController {
  addDataa();
}

class GenreAddControllerimp extends GenreAddController {
  MyServices myServices = Get.find();
  late TextEditingController name;
  late TextEditingController namear;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  File? file;
  choonseimage() async {
    file = await fileupload();
    update();
  }

  GenreData genreData = GenreData(Get.find());

  Map data = {
    "genre": "",
    "genre_ar": "",
  };

  Crud crud = Crud();

  @override
  addDataa() async {
    data["genre"] = name.text;
    data["genre_ar"] = namear.text;
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("warring", "Please Choose Image ");
        update();
      } else {
        var response = await genreData.addData(data, file!);
        if (response['status'] == "success") {
          Get.offNamed("genreview");
          GenreViewControllerimp controller = Get.find();
          controller.getdata();
          update();
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();

    super.onInit();
  }
}
