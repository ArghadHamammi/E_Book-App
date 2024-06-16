import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/homedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  getnotification();
}

class Notificationcontrollerimp extends NotificationController {
  MyServices myServices = Get.find();
  HomeData homedata = HomeData(Get.find());

  List noti = [];

  @override
  void onInit() {
    getnotification();
    super.onInit();
  }

  @override
  getnotification() async {
    var response = await homedata.allnotification();
   if(response['status'] != "success"){
          Get.rawSnackbar(title: "Sorry", messageText: Text("Not Found"));
   }else{
     noti.addAll(response['data']);
   }
    print(noti);

    update();
  }
}
