import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/favorite.dart';
import 'package:e_book/data/datasource/remote/homedata.dart';

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List data = [];
  List book = [];
  List recomm = [];
  FavoriteData favoritedata = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  HomeData homedata = HomeData(Get.find());

  Map isfavorite = {};

  setfavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addfavorite(String bookid) async {
    book.clear();

    var response = await favoritedata.addfav(
        myServices.sharedPreferences.getString("users_id")!, bookid.toString());
    if (response['status'] == 'success') {
      // data.addAll(response['data']);
      Get.rawSnackbar(
          title: "66".tr,
          messageText: Text("67".tr),
          backgroundColor: Colors.amber.shade100,
          duration: Duration(seconds: 1));
      getfavoritebooks();
      recome();
    } else {}
    update();
  }

  removefavotire(String bookid) async {
    var response = await favoritedata.removefav(
        myServices.sharedPreferences.getString("users_id")!, bookid.toString());
    if (response['status'] == 'success') {
      getfavoritebooks();
      recome();
    } else {
      print("not foundddddddddddddd");
    }
    update();
  }

  getfavoritebooks() async {
    book.clear();
    print("8888888888888888888888888888888888");
    var response = await favoritedata
        .favoritebook(myServices.sharedPreferences.getString("users_id")!);
    if (response['status'] == 'success') {
      book.addAll(response['data']);
      print(book);
    } else {
      Get.rawSnackbar(title: "Sorry", messageText: Text("Not Found !"));
    }
    update();
  }

  @override
  void onInit() {
    print("--------------------------------------------------------");
    getfavoritebooks();
    super.onInit();
  }

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
}
