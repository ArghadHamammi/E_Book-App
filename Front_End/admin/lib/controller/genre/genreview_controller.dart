import 'package:admin/core/class/crud.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/genredata.dart';
import 'package:get/get.dart';

abstract class GenreViewController extends GetxController {
  getdata();
  delete(String id, String image);
  gotoedit(String id, String name , String namear , String image);
}

class GenreViewControllerimp extends GenreViewController {
  MyServices myServices = Get.find();
  GenreData genreData = GenreData(Get.find());
  List genre = [];

  Crud crud = Crud();

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    genre.clear();
    update();
    var response = await genreData.getData();
    genre.addAll(response['data']);

    update();
  }

  @override
  delete(id, image) async {
  await genreData.deleteData({
      "categories_id": id,
      "genre_image": image,
    });
    
      getdata();
 
    update();
  }

  @override
  gotoedit(String id,String name , String namear, String image ) {
    Get.toNamed("genreedit", arguments: {
      "categories_id": id,
      "genre": name ,
      "genre_ar" : namear,
      "genre_image" : image
      
    });
  }
}
