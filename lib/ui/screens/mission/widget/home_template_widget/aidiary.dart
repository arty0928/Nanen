import 'package:flutter/material.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/constants/constants.dart';
import 'package:wonders/providers/chats_provider.dart';
import 'package:wonders/providers/models_provider.dart';
import 'package:wonders/screens/chat_screen.dart';

class AIScreen extends StatelessWidget {
  const AIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'AI와 대화하기',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // 배경에 맞게 변경하기
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              color: cardColor,
            )),
        home: ChatScreen(),
      ),
    );
  }
}
