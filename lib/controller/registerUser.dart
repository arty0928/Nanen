import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wonders/controller/login.dart';
import 'dart:convert';
import 'package:wonders/model/model.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/userInfo/userInfoProvider.dart';

class ApiEndPoints {
  static final String baseUrl = "https://0c55-222-109-27-193.ngrok-free.app";
  static _AuthEndPoints _authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String register = '/members/sign-up';
  final String login = '/login';
}

Future<void> registerUser(String userName, String userPassword, String userEmail, String userNickName,
    String userPasswordCheck, BuildContext context) async {
  print("signup");
  var headers = {'Content-Type': 'application/json'};
  var url = Uri.parse("https://113a-220-85-140-6.ngrok-free.app/members/sign-up");

  Map body = {
    "email": userEmail.trim(),
    "password": userPassword.trim(),
    "userName": userName.trim(),
    "userNickName": userNickName.trim()
  };

  if (userPassword == userPasswordCheck) {
    if (userEmail.contains("@")) {
      try {
        final response = await http.post(url, // Spring 서버의 URL로 변경
            body: json.encode(body),
            headers: headers);

        print(response);

        if (response.statusCode == 200) {
          print("회원가입 성공");
          print(response.body);
          // ignore: use_build_context_synchronously
          await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('회원가입 성공'),
                content: Text('회원가입에 성공하였습니다.'),
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

          Provider.of<UserInfoProvider>(context, listen: false).setUserInfo(userName: userName, isLoggedIn: true);

          // UserInfoProvider의 정보 출력
          print(Provider.of<UserInfoProvider>(context, listen: false).getUserInfo());

          // appRouter.go(ScreenPaths.home);
          Navigator.pop(context);

          // loginUser(userEmail, userPassword, context);
        } else {
          throw jsonDecode(response.body)['message'] ?? "알 수 없는 오류가 발생했습니다.";
        }
      } catch (error) {
        print(error);
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('회원가입 실패'),
              content: Text('회원가입에 실패했습니다.'),
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
    } else {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text('이메일 형식이 맞지 않습니다'),
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
  } else {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('회원가입 실패'),
          content: Text('비밀번호를 확인해주세요.'),
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
