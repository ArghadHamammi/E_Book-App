import 'package:admin/core/class/crud.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/bookdata.dart';
import 'package:get/get.dart';

abstract class BookViewcontroller extends GetxController {
  getdata();
  delete(String id, String image);
  gotoedit(String id, String title, String auther, String date, String image,String link ,String publisher , String ca );
}

class BookViewcontrollerimp extends BookViewcontroller {
  MyServices myServices = Get.find();
  BookData bookData = BookData(Get.find());
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
    var response = await bookData.getData();
    genre.addAll(response['data']);

    update();
  }
  

  @override
  delete(id, image) async {
    var response = await bookData.deleteData({
      "Book_id": id,
      "Book_image": image,
    });
    if (response['status'] == "success") {
      getdata();
    }
    update();
  }
  
  @override
  gotoedit(String id, String title, String auther, String date, String image, String link, String publisher, String ca) {
     Get.toNamed("bookedit", arguments: {
      "Book_id": id,
      "book_title": title,
      "book_auther": auther,
      "data_published": date,
      "Book_image": image,
      "book_link": link,
      "Book_ca": ca,
      "book_publisher": publisher
    });
  }

 
}
