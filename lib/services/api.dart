import 'dart:async';
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:yalies/utils/constants.dart';

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class API {
  Future<T> load<T>(Resource<T> resource) async {
    Map payload = {
        "query": "Victor",
        "filters": {
            "college": ["Grace Hopper", "Franklin"],
            "year": [2023, 2024],
            "major": ["Computer Science", "Italian"],
            "leave": true
        }
    }
    final msg = jsonEncode(filters);
    final Response response = await http.post(resource.url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + Constants.API_KEY,
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
