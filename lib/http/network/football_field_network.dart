import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_field_management_demo/http/model/footbal_field_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FootballFieldNetwork {
  static String url = 'http://localhost:8080/van-mo/FootballField';

  static Future<List<FootballField>> getFootballField() async {
    Uri uri = Uri.parse(url);

    var reponse = await http.get(uri);

    var jsonData = jsonDecode(const Utf8Decoder().convert(reponse.bodyBytes));

    List<FootballField> list = [];

    for (var element in jsonData) {
      FootballField footballField = FootballField(
        username: element["username"],
        nameFootballField: element["nameFootballField"],
        nameManage: element["nameManage"], 
        totalYards: element["totalYards"],
      );
      list.add(footballField);
    }

    return list;
  }

  static Future<FootballField> getFootballFieldByUsername(
      String username) async {
    Uri uri = Uri.parse('$url/$username');
    debugPrint('$uri');

    var reponse = await http.get(uri);

    var jsonData = jsonDecode(const Utf8Decoder().convert(reponse.bodyBytes));

    FootballField footballField = FootballField(
      username: jsonData["username"],
      nameFootballField: jsonData["nameFootballField"],
      nameManage: jsonData["nameManage"],
      totalYards: jsonData["totalYards"],
    );

    debugPrint(footballField.username);
    debugPrint(footballField.nameFootballField);
    debugPrint(footballField.nameManage);
    debugPrint("${footballField.totalYards}");

    return footballField;
  }

  static Future<dynamic> postFootballFied(FootballField footballField) async {
    Uri uri = Uri.parse(url);

    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    
    var body = jsonEncode(<String, dynamic>{
      "username": footballField.username,
      "nameFootballField": footballField.nameFootballField,
      "nameManage": footballField.nameManage,
      "totalYards": footballField.totalYards
    });

    Response response = await http.post(uri, headers: headers, body: body);
    debugPrint('status: ${response.statusCode}');
    debugPrint('body: ${response.body}');

    return response.statusCode;
  }
}
