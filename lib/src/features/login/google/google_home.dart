import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'google_login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            //로그인 실패
            return const LoginWidget();
          } else {
            //로그인 처리
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data?.displayName}님 환영합니다."),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: FirebaseAuth.instance.signOut,
                    child: const Text("로그아웃"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
