import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

class Crud {
  getRequest(String uri) async {
    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error");
      }
    } catch (e) {
      print("error catch");
    }
  }

  Future posrRequest(String uri, Map data) async {
    try {
      var response = await http.post(Uri.parse(uri), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      } else {
        print("Error");
      }
    } catch (e) {
      print("error catch");
    }
  }

  Future recom( String userid) async {
    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:5005/get_recommendations'),
        
        body: jsonEncode({'user_id': '$userid'}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      } else {
        print("Error");
      }
    } catch (e) {
      print("error catch");
    }
  }

  postRequestWithFile(String uri, Map data, File file) async {
    var request = http.MultipartRequest("post", Uri.parse(uri));
    var length = await file.length();
    var strem = http.ByteStream(file.openRead());
    var multipartfile = http.MultipartFile("file", strem, length,
        filename: basename(file.path));
    request.files.add(multipartfile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error ${myrequest.statusCode}");
    }
  }
}
