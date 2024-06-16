// import 'dart:math';

import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/allbook.dart';
import 'package:e_book/data/datasource/remote/homedata.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:e_book/data/datasource/remote/homedata.dart';
// import 'package:e_book/view/widget/Home/homecategories.dart';
import 'package:get/get.dart';

abstract class BookController extends GetxController {
  initData();
  changcat(int val, String categoryid);
  changebook(int num);
  // getbook(String categoryid);
  getfavbook(String categoryid);
  gotobookdetails(List book);
  getrating(String bookid);
}

class BookControllerimp extends BookController {
  List categories = [];
  List ratea = [];

  int? checked;
  dynamic rate = 2;
  var rating;
  String? categoryidd;
  List books = [];
  var isLoading = true.obs;
  late int index;
  MyServices myServices = Get.find();
  BookData bookdata = BookData(Get.find());
  HomeData homedata = HomeData(Get.find());

  @override
  initData() {
    categories = Get.arguments['categories'];
    checked = Get.arguments['checked'];
    categoryidd = Get.arguments['categoryid'];
    // getbook(categoryidd!);
    getfavbook(categoryidd!);
    update();
  }

  @override
  changcat(val, catid) {
    checked = val;
    categoryidd = catid;
    // getbook(categoryidd!);
    getfavbook(categoryidd!);
    update();
  }

  @override
  void onInit() {
    initData();

    super.onInit();
  }

   

  @override
  gotobookdetails(books) {
    Get.toNamed("bookdetails", arguments: {
      "data": books,
      "categoryid": categoryidd,
      "checked": checked,
      "index": index,
    });
  }

  @override
  changebook(num) {
    index = num;
    update();
  }

  @override
  getfavbook(categoryid) async {
    isLoading(true);
    books.clear();
    var response = await bookdata.getfavbook(
        categoryid, myServices.sharedPreferences.getString("users_id")!);
    if (response['status'] == 'success') {
      books.addAll(response['data']);
      isLoading(false);
    } else {
      Get.rawSnackbar(title: "Sorry", messageText: Text("Not Found !"));
    }
    update();
  }

  @override
  getrating(String bookid) async {
    print("Run================");

    var response = await homedata.getrating(bookid);

    if (response['status'] == 'success') {
      if (response['data'] != null && response['data'].isNotEmpty) {
        // تحديث قيمة التقييم
        print("ok====================");
        rating = double.tryParse(response['data'][0]['rating']);
        if (rating == null) {
          // في حالة عدم تمكن من تحويل القيمة إلى double
          // يمكن تعيين قيمة افتراضية
          rating = 2.0;
        }
        print("Rating: $rating");
      } else {
        // في حالة عدم وجود بيانات تقييم متوفرة
        print("No rating data available.");
      }
    }

    // تحديث الواجهة إذا تم تغيير قيمة التقييم
    update();
  }
}
