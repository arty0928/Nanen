import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nanen/src/features/core/screens/Home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const HomePage();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
