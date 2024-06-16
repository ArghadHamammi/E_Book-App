// import 'dart:convert';

import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constant/linkapi.dart';

// import 'package:e_book/core/services/services.dart';
// import 'package:http/http.dart' as http;

class BookData {
  Crud crud;
  BookData(this.crud);
  getData() async {
    var response = await crud.posrRequest(bookView, {});
    return response;
  }

 
   addData(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(bookAdd, data, file);
    return response;
  }

  deleteData(Map data ) async {
    var response = await crud.posrRequest(bookDelete, data);
    return response;
  }

  editData(Map data) async {
    var response = await crud.posrRequest(bookEdit, data);
    return response;
  }
   vieweditgenre(String id) async {
    var response =
        await crud.posrRequest(bookeviewEdit, {"Book_id": id.toString()});
    return response;
  }
     sendnotification(String title,String auther) async {
    var response =
        await crud.posrRequest(sendnoti, {
          "title": title.toString(),
          "auther": auther.toString()
          
          });
    return response;
  }
}
