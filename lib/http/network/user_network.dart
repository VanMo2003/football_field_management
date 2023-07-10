import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserNetwork {
  static String url = 'http://localhost:8080/van-mo/user';

  static Future<User> getUser(String username) async {
    Uri uri = Uri.parse('$url/$username');
    debugPrint('$uri');

    var reponse = await http.get(uri);

    var jsonData = jsonDecode(const Utf8Decoder().convert(reponse.bodyBytes));

    User user = User(
      username: jsonData["username"],
      nameUser: jsonData["nameUser"],
      phoneNumber: jsonData["phoneNumber"],
    );

    debugPrint(user.username);
    debugPrint(user.nameUser);
    debugPrint(user.phoneNumber);

    return user;
  }

  static Future<dynamic> postUser(User user) async {
    Uri uri = Uri.parse(url);

    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    var body = jsonEncode(<String, dynamic>{
      "username": user.username,
      "nameUser": user.nameUser,
      "phoneNumber": user.phoneNumber,
    });

    Response response = await http.post(uri, headers: headers, body: body);
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    return response.statusCode;
  }
}
