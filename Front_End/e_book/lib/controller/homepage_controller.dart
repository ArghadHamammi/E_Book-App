import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/homedata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:e_book/view/widget/Home/homecategories.dart';
// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  initialdata();
  checksearch(val);
  newbook();

  changebook(num);
  recome();
  onsearchchange();
  gotobookdetails(searchbook, index);
  getdata();
  gotobook(List categories, int checked, String categoryid);
  getsearchbook();
}

class HomePageControllerimp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  TextEditingController? searchtext;
  String? id;
  HomeData homedata = HomeData(Get.find());
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
    getdata();
    newbook();
    // checksearch(searchtext!.text);
    FirebaseMessaging.instance.subscribeToTopic("users");
    recome();
    initialdata();
    super.onInit();
  }

  @override
  getdata() async {
    var response = await homedata.getData();
    categories.addAll(response['categories']);
    print(categories);
    books.addAll(response['allbook']);

    update();
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
  recome() async {
    var responsebody = await homedata.recomData(
        myServices.sharedPreferences.getString("users_id").toString());
    print("${myServices.sharedPreferences.getString("users_id").toString()}");
    if (responsebody['data'] != null) {
      print("111111111111111111111111111");
      print(responsebody);
      recomm.addAll(responsebody['data']);
    } else {
      print("00000000000000000000000");
    }

    update();
  }

  @override
  newbook() async {
    var response = await homedata.getNew();
    nbook.addAll(response['data']);
    update();
  }

  @override
  getsearchbook() async {
    var response = await homedata.searchbook(searchtext!.text);
    if (response['status'] == "success") {
      searchbook.clear();
      searchbook.addAll(response['data']);
      // print("helllllllllllllllllllllllllllllllo $searchbook");
    }

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
    getsearchbook();
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
