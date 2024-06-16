// import 'package:flutter/material.dart';
import 'package:e_book/view/screen/favorite.dart';
import 'package:e_book/view/screen/homepage.dart';
import 'package:e_book/view/screen/profile.dart';
import 'package:e_book/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int page);
}

class HomeScreenControllerimp extends HomeScreenController {
  int currentpage = 0;
  List  listpage = [
    const HomePage(),
   Setting(),
    Profile(),
     Favorite()
  ];
  List bottomapp = [
    {
      "title": "68".tr,
      "icon": Icons.home,
    },
    {
      "title": "69".tr,
      "icon": Icons.settings,
    },
    {
      "title": "70".tr,
      "icon": Icons.person,
    },
    {
      "title": "71".tr,
      "icon": Icons.favorite,
    },
  ];

  @override
  changepage(int page) {
    currentpage = page;
    update();
  }
}
