import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/https/userdata.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'http://localhost:8080/van-mo';

  static Future<List<UserInformation>> getUserDataByNumberYard(
      String nameField, int numberYard) async {
    var response = await http.get(Uri.parse('$url/$nameField/$numberYard'));
    debugPrint('url : $url/$nameField/$numberYard');
    var jsonData = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));

    List<UserInformation> list = [];
    for (var element in jsonData) {
      UserInformation userInformation = UserInformation();
      userInformation.nameUser = element['nameUser'];
      userInformation.phoneNumber = element['phoneNumber'];
      userInformation.timeSlot = element['timeSlot'];
      userInformation.dataToday = element['dataToday'];

      list.add(userInformation);
    }

    return list;
  }
}
