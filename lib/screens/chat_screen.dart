import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wonders/common_libs.dart';
import 'package:wonders/constants/constants.dart';
import 'package:wonders/models/chat_model.dart';
import 'package:wonders/providers/chats_provider.dart';
import 'package:wonders/providers/models_provider.dart';
import 'package:wonders/services/api_service.dart';
import 'package:wonders/services/assets_manager.dart';
import 'package:wonders/services/services.dart';
import 'package:wonders/ui/screens/calendar/calendar_screen.dart';
import 'package:wonders/ui/screens/mission/widget/home_template_widget/mission_detail_screen.dart';
import 'package:wonders/widgets/chat_widget.dart';
import 'package:wonders/widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  //List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: TextWidget(
          label: 'Naneun AI Chat',
          fontSize: 25,
        ),
        actions: [
          IconButton(
            // onPressed: () async {
            //   await Services.showModalSheet(context: context);
            // },
            // onPressed: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarScreen(animationController: null,)));
            // },
            // 여기 Navigator 을 Calendar로 하면 될 듯 합니다
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.getChatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatProvider.getChatList[index].msg,
                    chatIndex: chatProvider.getChatList[index].chatIndex,
                  );
                }),
          ),
          if (_isTyping) ...[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
          ],
          SizedBox(
            height: 15,
          ),
          Material(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        await sendMessageFCT(modelsProvider: modelsProvider, chatProvider: chatProvider);
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: 'How can I help you', hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        sendMessageFCT(
                          modelsProvider: modelsProvider,
                          chatProvider: chatProvider,
                        );
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(_listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT({required ModelsProvider modelsProvider, required ChatProvider chatProvider}) async {
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: 'Please type a message',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        //chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(msg: msg, chosenModelId: modelsProvider.getCurrentModel);
      // chatList.addAll(await ApiService.sendMessage(
      //     message: textEditingController.text,
      //     modelId: modelsProvider.getCurrentModel));
    } catch (error) {
      print('error $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}
