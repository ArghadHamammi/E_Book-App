import 'package:admin/core/class/crud.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/genredata.dart';
import 'package:get/get.dart';

abstract class UsersViewController extends GetxController {
  getdata();
}

class UsersViewControllerimp extends UsersViewController {
  MyServices myServices = Get.find();
  GenreData genreData = GenreData(Get.find());
  List users = [];
  List numer = [];
  Crud crud = Crud();

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    var response = await genreData.usersdata();
    users.addAll(response['data']);
    // numer.addAll(response['number']);

    update();
  }
}
