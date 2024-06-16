// import 'dart:convert';

import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constant/linkapi.dart';

// import 'package:e_book/core/services/services.dart';
// import 'package:http/http.dart' as http;

class GenreData {
  Crud crud;
  GenreData(this.crud);
  getData() async {
    var response = await crud.posrRequest(genreView, {});
    return response;
  }

  addData(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(genreAdd, data, file);
    return response;
  }

  deleteData(Map data) async {
    var response = await crud.posrRequest(genreDelete, data);
    return response;
  }

  editData(Map data) async {
    var response = await crud.posrRequest(genreEdit, data);
    return response;
  }

  usersdata() async {
    var response = await crud.posrRequest(usersview, {});
    return response;
  }
   vieweditgenre(String id) async {
    var response = await crud.posrRequest(genreviewEdit, {
      "categories_id" : id.toString()
    });
    return response;
  }
}
