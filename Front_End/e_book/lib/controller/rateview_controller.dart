// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book/core/services/services.dart';
import 'package:e_book/data/datasource/remote/homedata.dart';
import 'package:get/get.dart';

abstract class RatingVire_Controller extends GetxController {
  rating(rating, bookid);
  checkrating(bookid);
}

class RatingVire_Controllerimp extends RatingVire_Controller {
  HomeData homedata = HomeData(Get.find());
  MyServices myServices = Get.find();
    bool israte = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  rating(rating, bookid) async {
    await homedata.addrate(
        myServices.sharedPreferences.getString("users_id").toString(),
        bookid,
        rating.toString());

    update();
  }

  @override
  checkrating(bookid) async {
    var response = await homedata.checkfromrating(
      myServices.sharedPreferences.getString("users_id").toString(),
      bookid,
    );
    if (response['status'] == 'success') {
      israte = true;
    }

    update();
  }
}
