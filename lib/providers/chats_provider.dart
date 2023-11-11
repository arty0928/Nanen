import 'package:wonders/common_libs.dart';
import 'package:wonders/models/chat_model.dart';
import 'package:wonders/services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers({required String msg, required String chosenModelId}) async {
    chatList.addAll(
      await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
        //log(utf8.decode(msg)),
      ),
    );
    notifyListeners();
  }
}
