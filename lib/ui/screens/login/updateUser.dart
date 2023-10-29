import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wonders/model/model.dart';

Future<UserModel> updateEmployees(
    UserModel user, BuildContext context) async {
  var Url = "http://localhost:8080/updateemployee";
  var response = await http.put(Url as Uri,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(user));
  
  String responseString = response.body;

  if (response.statusCode == 200) {
    Map<String, dynamic> userJson = json.decode(response.body);

    UserModel user = UserModel.fromJson(userJson);
    return user;
  } else {
    throw Exception("사용자 등록에 실패했습니다.");
  }
}
