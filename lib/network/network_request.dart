import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:football_field_management_demo/models/https/result_by_number_yard.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'http://localhost:8080/api/fbm';

  static List<ResultByNumberYard> pasrePost(String reponseBody) {
    var list = json.decode(reponseBody) as List<dynamic>;

    List<ResultByNumberYard> result =
        list.map((model) => ResultByNumberYard.fromJson(model)).toList();

    return result;
  }

   Future<List<ResultByNumberYard>?> fetchPost(String name, int numberYard) async {
    Uri uri = Uri.parse('$url/Sân Đông Xá/$numberYard');
    debugPrint('$uri');

    final reponse = await http.get(uri);
    if (reponse.statusCode == 200) {
      return compute(pasrePost, reponse.body);
    }
  }
}
