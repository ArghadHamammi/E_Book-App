import 'package:e_book/core/class/crud.dart';
import 'package:e_book/core/constant/linkapi.dart';

class BookData {
  Crud crud;
  BookData(this.crud);
  getfavbook(String id, String userid) async {
    var response = await crud
        .posrRequest(favbook, {"id": id.toString(), "userid": userid});
    return response;
  }

  getbook(String id) async {
    var response = await crud.posrRequest(allbook, {
      "id": id.toString(),
    });
    return response;
  }

  getlibrary(String userid) async {
    var response = await crud.posrRequest(library, {
      "library_userid": userid.toString(),
    });
    return response;
  }

  delete(String userid, String bookid) async {
    var response = await crud.posrRequest(deletelibrary, {
      "library_userid": userid.toString(),
      "library_bookid": bookid.toString(),
    });
    return response;
  }

  complete(String bookid) async {
    var response = await crud.posrRequest(updatelibrary, {
      "library_bookid": bookid.toString(),
    });
    return response;
  }

  notcomplete(String bookid) async {
    var response = await crud.posrRequest(notcompletea, {
      "library_bookid": bookid.toString(),
    });
    return response;
  }

  addtolibrary(String userid, String bookid) async {
    var response = await crud.posrRequest(addtolib, {
      "library_userid": userid.toString(),
      "library_bookid": bookid.toString(),
    });
    if (response['status'] == "success") {
      print("use");
    }
    return response;
  }
   searchbook(String val) async {
    var response = await crud.posrRequest(search, {
      "search": val.toString(),
    });
    return response;
  }
  

  checklib(String userid, String bookid) async {
    var response = await crud.posrRequest(checklibrary, {
      "library_userid": userid.toString(),
      "library_bookid": bookid.toString(),
    });
    return response;
  }

}
