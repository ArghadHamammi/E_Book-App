import 'dart:io';
import 'package:admin/data/bookdata.dart';
import 'package:admin/core/class/crud.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/genredata.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BookAddController extends GetxController {
  addDataa();
  getdata();
  sendnitification(String title, String auther);
}

class BookAddControllerimp extends BookAddController {
  MyServices myServices = Get.find();
  List<SelectedListItem> selectganre = [];
  late TextEditingController newtitle;
  late TextEditingController newauther;
  late TextEditingController newpublisher;
  late TextEditingController neewlink;
  late TextEditingController newdate;

  late TextEditingController dropname;
  late TextEditingController dropid;
  List genre = [];

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  File? file;
  choonseimage() async {
    file = await fileupload();
    update();
  }

  GenreData genreData = GenreData(Get.find());
  BookData bookData = BookData(Get.find());

  Map data = {
    "book_title": "",
    "book_auther": "",
    "book_link": "",
    "data_published": "",
    "book_publisher": "",
    "Book_ca": "",
  };

  Crud crud = Crud();

  @override
  addDataa() async {
    data["book_title"] = newtitle.text;
    data["book_auther"] = newauther.text;
    data["data_published"] = newdate.text;
    data["book_link"] = neewlink.text;
    data["book_publisher"] = newpublisher.text;
    data["Book_ca"] = dropid.text;
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("warring", "Please Choose Image ");
        update();
      } else {
        var response = await bookData.addData(data, file!);
        if (response['status'] == "success") {
          sendnitification(newtitle.text,newauther.text);
          Get.offNamed("bookview");
          BookAddControllerimp controller = Get.find();
          controller.getdata();
          update();
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    newtitle = TextEditingController();
    newauther = TextEditingController();
    newdate = TextEditingController();
    newpublisher = TextEditingController();
    neewlink = TextEditingController();
    newdate = TextEditingController();
    dropname = TextEditingController();
    dropid = TextEditingController();
    getdata();

    super.onInit();
  }

  @override
  getdata() async {
    genre.clear();
    update();
    var response = await genreData.getData();
    genre.addAll(response['data']);
    for (int i = 0; i < genre.length; i++) {
      selectganre.add(SelectedListItem(
          name: genre[i]['genre'],
          value: genre[i]['categories_id'].toString()));
    }
    update();
  }

  @override
  sendnitification(String title, String auther) async {
    await bookData.sendnotification(title, auther);
  }
}
