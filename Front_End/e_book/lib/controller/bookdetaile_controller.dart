import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/allbook.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BookDetaileController extends GetxController {
  // getbook(String categoryid);
  checklib(String bookid);
}

class BookDetaileControllerimp extends BookDetaileController {
  List books = [];
  // var isLoading = true.obs;

  BookData bookdata = BookData(Get.find());
  MyServices myServices = Get.find();
  late String categoryid;
  late int num;

  initData() {
    books = Get.arguments['data'];
    num = Get.arguments['index'];

    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  add(String bookid) async {
    await bookdata.addtolibrary(
        myServices.sharedPreferences.getString("users_id")!, bookid);

    update();
  }

  @override
  checklib(String bookid) async {
    var response = await bookdata.checklib(
      myServices.sharedPreferences.getString("users_id").toString(),
      bookid,
    );
    if (response['status'] == 'success') {
      Get.rawSnackbar(
          title: "Sorry",
          messageText: Text("Already Add!"),
          backgroundColor: Colors.amber.shade100,
          duration: Duration(seconds: 1));
    } else {
      Get.rawSnackbar(
          title: "done",
          messageText: Text(" Add!"),
          backgroundColor: Colors.amber.shade100,
          duration: Duration(seconds: 1));

      add(bookid);
    }

    update();
  }
}
