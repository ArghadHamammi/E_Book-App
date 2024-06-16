 
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
// import 'package:e_book/view/widget/Home/homecategories.dart';
// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  initialdata();
  checksearch(val);

  changebook(num);
  onsearchchange();
  gotobookdetails(searchbook, index);
  gotobook(List categories, int checked, String categoryid);
}

class HomePageControllerimp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  TextEditingController? searchtext;
  String? id;
  bool isearch = false;
  List data = [];
  List categories = [];
  List books = [];
  List recomm = [];
  List nbook = [];
  List searchbook = [];
  late int index;
  int? checked;
  String? categoryidd;

  @override
  initialdata() {
    id = myServices.sharedPreferences.getString("users_id");
    username = myServices.sharedPreferences.getString("users_name");
  }

  @override
  void onInit() {
    searchtext = TextEditingController();
   
    initialdata();
    super.onInit();
  }

 

  @override
  gotobook(categories, checked, categoryid) {
    Get.toNamed("/books", arguments: {
      "categories": categories,
      "checked": checked,
      "categoryid": categoryid,
    });
    update();
  }

  

  @override
  checksearch(val) {
    if (val == "") {
      isearch = false;
      // }else{
      //    isearch = true;
      //   getsearchbook();
    }

    update();
  }

  @override
  onsearchchange() {
    isearch = true;
 
    update();
  }

  @override
  gotobookdetails(searchbook, index) {
    Get.toNamed("bookdetails", arguments: {
      "data": searchbook,
      "index": index,
    });
  }

  @override
  changebook(num) {
    index = num;
    update();
  }
  
}
