// import 'dart:convert';

import 'package:e_book/core/class/crud.dart';
import 'package:e_book/core/constant/linkapi.dart';
// import 'package:e_book/core/services/services.dart';
// import 'package:http/http.dart' as http;

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.posrRequest(linkhomepage, {});
    return response;
  }

  recomData(String userid) async {
    var response = await crud.recom(userid);
    return response;
  }

  getNew() async {
    var response = await crud.posrRequest(newbook, {});
    return response;
  }

  searchbook(String val) async {
    var response = await crud.posrRequest(search, {
      "search": val.toString(),
    });
    return response;
  }

  allnotification() async {
    var response = await crud.posrRequest(notificationview, {});
    return response;
  }

  addrate(String userid, String bookid, String rate) async {
    var response = await crud.posrRequest(addrating, {
      "userid": userid.toString(),
      "bookid": bookid.toString(),
      "rating": rate.toString()
    });
    return response;
  }

  checkfromrating(String userid, String bookid) async {
    var response = await crud.posrRequest(checkrating, {
      "userid": userid.toString(),
      "bookid": bookid.toString(),
    });
    return response;
  }

  getrating(String bookid) async {
    var response = await crud.posrRequest(getratingbook, {
      "bookid": bookid.toString(),
    });
    return response;
  }
}
