import 'package:e_book/data/datasource/remote/allbook.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_book/core/services/services.dart';

abstract class ListBookController extends GetxController {
  getbook(String categoryid);
  initData();
  gotobookdetails(List book);
}

class ListBookControllerImp extends ListBookController {
  List books = [];
  MyServices myServices = Get.find();
  int? checked;
  String? categoryid;
  List categories = [];
  BookData bookdata = BookData(Get.find());
  @override
  @override
  initData() {
    categories = Get.arguments['categories'];
    checked = Get.arguments['checked'];
    categoryid = Get.arguments['categoryid'];
    getbook(categoryid!);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  // getdata() async {
  //   var response = await homedata.getData();
  //   books.addAll(response['allbook']);
  //   update();
  // }

  @override
  getbook(categoryid) async {
    var response = await bookdata.getfavbook(
        categoryid, myServices.sharedPreferences.getString("users_id")!);
    if (response['status'] == 'success') {
      books.addAll(response['data']);
    } else {
           Get.rawSnackbar(title: "Sorry", messageText: Text("Not Found"));

    }

    update();
  }

  @override
  gotobookdetails(books) {
    Get.toNamed("bookdetails", arguments: {
      "data": books,
      "categoryid": categoryid,
      "checked": checked,
    });
  }
}
