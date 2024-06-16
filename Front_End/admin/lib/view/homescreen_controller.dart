 
import 'package:admin/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int page);
}

class HomeScreenControllerimp extends HomeScreenController {
  int currentpage = 0;
  List  listpage = [
    const HomePage(),
 
    const Center(
      child: Text("Profile"),
    ),
  ];
  List bottomapp = [
    {
      "title": "68".tr,
      "icon": Icons.home,
    },
   
    {
      "title": "70".tr,
      "icon": Icons.person,
    },
    
  ];

  @override
  changepage(int page) {
    currentpage = page;
    update();
  }
}
