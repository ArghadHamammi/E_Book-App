import 'package:e_book/core/class/crud.dart';
import 'package:e_book/core/constant/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addfav(String userid, String bookid) async {
    var response = await crud
        .posrRequest(favadd, {"userid": userid, "bookid": bookid.toString()});
    return response;
  }

  removefav(String userid, String bookid) async {
    var response = await crud.posrRequest(
        favremove, {"userid": userid, "bookid": bookid.toString()});
    return response;
  }

  favoritebook(String userid) async {
    var response = await crud.posrRequest(favrbook, {"userid": userid.toString()});
    return response;
  }

   deletefavbyid(String favoriteid) async {
    var response = await crud.posrRequest(deletefavorite, {"id": favoriteid.toString()});
    return response;
  }
  
}
