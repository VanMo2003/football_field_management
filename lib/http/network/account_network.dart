import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/model/account.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AccountNetwork {
  static String url = "http://localhost:8080/van-mo/account";

  static Future<dynamic> checkLogin(Account account) async {
    Uri uri = Uri.parse("$url/login");

    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    var body = jsonEncode(<String, dynamic>{
      'userName': account.userName,
      'password': account.password,
      'permission': account.permission ?? false
    });

    Response response = await http.post(uri, headers: headers, body: body);
    debugPrint('${response.statusCode}');
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return response.statusCode;
    }
    return response.body;
  }

  static Future<dynamic> postAccount(Account account) async {
    Uri uri = Uri.parse(url);

    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    var body = jsonEncode(<String, dynamic>{
      'userName': account.userName,
      'password': account.password,
      'permission': account.permission
    });

    Response response = await http.post(uri, headers: headers, body: body);
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    if (response.statusCode == 200) {
      return response.statusCode;
    }

    return response.body;
  }
}
