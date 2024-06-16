import 'dart:io';

import 'package:admin/controller/genre/genreview_controller.dart';
import 'package:admin/core/class/crud.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/genredata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class GenreditController extends GetxController {
  editdata();
}

class GenreditControllerimp extends GenreditController {
  MyServices myServices = Get.find();
  late TextEditingController newname;
  late TextEditingController newnamear;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String id;
  late String namegenre;
  late String namegenrear;
  late String image;

  bool isloading = false;
  List edit = [];

  File? file;
  choonseimage() async {
    file = await fileupload();
    update();
  }

  GenreData genreData = GenreData(Get.find());

  Map data = {
    "categories_id" : "",
    "genre": "",
    "genre_ar": "",
  };

  Crud crud = Crud();

  @override
  void onInit() {
    id = Get.arguments['categories_id'];
    namegenre = Get.arguments['genre'];
    namegenrear = Get.arguments['genre_ar'];
    image = Get.arguments['genre_image'];

    getolddata();
    print(id);
    newname = TextEditingController();
    newnamear = TextEditingController();

    super.onInit();
  }

  getolddata() async {
    edit.clear();
    var response = await genreData.vieweditgenre(id);
    if (response['status'] == "success") {
      edit.addAll(response['data']);
      isloading = true;
      print(edit);
    }
  }

  @override
  editdata() async {
     data["categories_id"] = id;
     data["genre"] = newname.text;
    data["genre_ar"] = newnamear.text;
    

    var response = await genreData.editData(data);
    print(response);
    if (response['status'] == "success") {
      Get.offNamed("genreview");
      GenreViewControllerimp controller = Get.find();
      controller.getdata();
    }
    update();
  }
}
