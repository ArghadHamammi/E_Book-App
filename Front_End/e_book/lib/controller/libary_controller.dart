import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/allbook.dart';
import 'package:e_book/data/datasource/remote/homedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LibaryController extends GetxController {
  getlibraryyy();
  // getdata();
  delete(String bookid);
  complete(String bookid);
  notcomplete(String bookid);
  // add(String bookid);
  gotobookdetails(searchbook, index);
  checkrating(String bookid);
}

class LibaryControllerimp extends LibaryController {
  MyServices myServices = Get.find();
  bool israte = false;
  var isLoading = true.obs;
  BookData bookdata = BookData(Get.find());
  HomeData homedata = HomeData(Get.find());

  List categories = [];
  int? checked;
  String? categoryidd;
  List books = [];
  List library = [];
  @override
  void onInit() {
    // getdata();
    getlibraryyy();

    super.onInit();
  }

  // // @override
  // // getdata() async {
  // //   var response = await homedata.getData();

  // //   books.addAll(response['allbook']);
  // //   print("////////////////////////////111111111");
  // //   print(books);
  // //   update();
  // // }
  // @override
  // getdata() async {
  //   isLoading(true); // تعيين حالة التحميل إلى true عند بداية جلب البيانات
  //   var response = await homedata.getData();
  //   books.addAll(response['allbook']);

  //   isLoading(false); // تعيين حالة التحميل إلى false بعد اكتمال جلب البيانات
  //   update();
  // }

  // @override
  // getlibraryyy() async {
  //   library.clear();
  //   var response = await bookdata
  //       .getlibrary(myServices.sharedPreferences.getString("users_id")!);
  //   library.addAll(response['data']);

  //   update();
  // }
  @override
  getlibraryyy() async {
    isLoading(true); // تعيين حالة التحميل إلى true عند بداية جلب البيانات
    library.clear();
    var response = await bookdata
        .getlibrary(myServices.sharedPreferences.getString("users_id")!);
    if (response['status'] == "failure") {
      print("failllll");
      Get.rawSnackbar(
        title: "Sorry",
        messageText: Text("Not Found !"),
      );
    } else {
      library.addAll(response['data']);
      isLoading(false); //
    }

    update();
  }

  @override
  delete(String bookid) async {
    await bookdata.delete(
        myServices.sharedPreferences.getString("users_id")!, bookid);

    getlibraryyy();
    update();
  }

  @override
  complete(String bookid) async {
    await bookdata.complete(bookid);

    getlibraryyy();
    update();
  }

  @override
  notcomplete(String bookid) async {
    await bookdata.notcomplete(bookid);

    getlibraryyy();
    update();
  }

  // @override
  // add(String bookid) async {
  //   await bookdata.addtolibrary(
  //       myServices.sharedPreferences.getString("users_id")!, bookid);

  //   getlibraryyy();
  //   update();
  // }

  @override
  gotobookdetails(searchbook, index) {
    Get.toNamed("bookdetails", arguments: {
      "data": library,
      "index": index,
    });
  }

  @override
  checkrating(bookid) async {
    var response = await homedata.checkfromrating(
      myServices.sharedPreferences.getString("users_id").toString(),
      bookid,
    );
    if (response['status'] == 'success') {
      israte = true;
    } else {
      israte = false;
    }

    update();
  }
}
