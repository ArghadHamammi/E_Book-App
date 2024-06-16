 

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> logout(var a) {
  Get.defaultDialog(title: "48".tr, middleText: "88".tr, actions: [
    ElevatedButton(
        onPressed: () {
          a;
        },
        child: Text("50".tr)),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("51".tr)),
  ]);
  return Future.value(true);
}
