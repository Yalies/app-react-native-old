import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:yalies/utils/constants.dart';
import 'dart:convert';

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  Future<T> load<T>(Resource<T> resource) async {
    Map data = {
      "college": ["Grace Hopper", "Franklin"],
      "year": [2023, 2024],
      "major": ["Computer Science", "Italian"],
      "entryway": ["A"],
      "floor": [4],
      "suite": [1],
      "leave": true
    };
    final msg = jsonEncode(data);
    final Response response = await http.post(resource.url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json',
          'Authorization': Constants.API_KEY,
        },
        body: msg);

    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      //final responseJson = json.decode(response.body);
      //log(responseJson.toString());
      log(response.statusCode.toString());
      throw Exception('Failed to load data!');
    }
  }
}
