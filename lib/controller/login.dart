import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wonders/model/model.dart';
import 'package:wonders/common_libs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> loginUser(String userEmail, String userPassword, BuildContext context) async {
  var headers = {'Content-Type': 'application/json'};
  var url = Uri.parse("https://0c55-222-109-27-193.ngrok-free.app/members/login");

  Map body = {
    "email": userEmail.trim(),
    "password": userPassword.trim(),
  };

  try {
    final response = await http.post(url, // Spring 서버의 URL로 변경
        body: json.encode(body),
        headers: headers);

    if (response.statusCode == 200) {
      print("로그인 성공");
      print(jsonDecode(response.body));
      Map<String, dynamic> result = jsonDecode(response.body)['result'];
      print(result);

      appRouter.go(ScreenPaths.home);
    } else {
      // 로그인 실패 처리
      String errorMessage = jsonDecode(response.body)['message'] ?? "알 수 없는 오류가 발생했습니다.";
    }
  } catch (error) {
    // ignore: use_build_context_synchronously
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 실패'),
          content: Text('로그인에 실패했습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }
}
