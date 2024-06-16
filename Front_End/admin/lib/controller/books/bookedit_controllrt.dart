import 'dart:io';

import 'package:admin/controller/books/bookview_controller.dart';
import 'package:admin/core/class/crud.dart';
import 'package:admin/core/function/uploadfile.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/bookdata.dart';
import 'package:admin/data/genredata.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BookEdit extends GetxController {
  editdata();
  getdata();
}

class BookEditimp extends BookEdit {
  MyServices myServices = Get.find();

  late TextEditingController newtitle;
  late TextEditingController newauther;
  late TextEditingController newdate;
  late TextEditingController newca;
  late TextEditingController newpublisher;
  late TextEditingController newlink;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String id;
  late String title;
  late String auther;
  late String date;
  late String image;
  late String link;
  late String publisher;
  late String ca;
  List<SelectedListItem> selectganre = [];

  List genre = [];

  late TextEditingController dropname;
  late TextEditingController dropid;

  // late String image;

  bool isloading = false;
  List edit = [];

  File? file;
  choonseimage() async {
    file = await fileupload();
    update();
  }

  BookData bookData = BookData(Get.find());
  GenreData genreData = GenreData(Get.find());

  Map data = {
    "Book_id": "",
    "book_title": "",
    "book_auther": "",
    "data_published": "",
    "Book_image": "",
    "book_link": "",
    "Book_ca": "",
  };

  Crud crud = Crud();

  @override
  void onInit() {
    id = Get.arguments['Book_id'];
    title = Get.arguments['book_title'];
    auther = Get.arguments['book_auther'];
    date = Get.arguments['data_published'];
    image = Get.arguments['Book_image'];
    link = Get.arguments['book_link'];
    publisher = Get.arguments['book_publisher'];
    ca = Get.arguments['Book_image'];

    getolddata();

    newtitle = TextEditingController();
    newauther = TextEditingController();
    newdate = TextEditingController();
    newlink = TextEditingController();
    newca = TextEditingController();
    newpublisher = TextEditingController();

    dropname = TextEditingController();
    dropid = TextEditingController();
    getdata();
    super.onInit();
  }

  getolddata() async {
    edit.clear();
    var response = await bookData.vieweditgenre(id);
    if (response['status'] == "success") {
      edit.addAll(response['data']);
      isloading = true;
      print(edit);
    }
  }

  @override
  editdata() async {
    data["Book_id"] = id;
    data["book_title"] = newtitle.text;
    data["book_auther"] = newauther.text;
    data["data_published"] = newdate.text;
    data["book_link"] = newlink.text;
    data["book_publisher"] = newpublisher.text;
    data["Book_ca"] = dropid.text;

    var response = await bookData.editData(data);
    print(response);
    if (response['status'] == "success") {
      Get.offNamed("bookview");
      BookViewcontrollerimp controller = Get.find();
      controller.getdata();
    }
    update();
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
}
