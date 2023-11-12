import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wonders/constants/api_consts.dart';
import 'package:wonders/models/chat_model.dart';
import 'package:wonders/models/models_model.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$BASE_URL/models'),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        //print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']['message']);
      }
      //print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        log("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }

  // Send Message fct
  static Future<List<ChatModel>> sendMessage({required String message, required String modelId}) async {
    try {
      log('modelId $modelId');
      var response = await http.post(
        Uri.parse('$BASE_URL/chat/completions'),
        headers: {'Authorization': 'Bearer $API_KEY', 'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'model': 'gpt-3.5-turbo',
            // "messages": [
            //   {"role": "user", "content": "Hello what is flutter"}
            // ],
            //"model": modelId,
            'messages': [
              {'role': 'user', 'content': message}
            ],

            'temperature': 0.7,
            'max_tokens': 100,
          },
        ),
      );

      //origin Map jsonResponse = jsonDecode(response.body);
      Map jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonResponse['error'] != null) {
        //print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        //log("jsonResponse[choices]text ${jsonResponse["choices"][0]["message"]["contents"]}");
        //log("jsonResponse[choices]text ${jsonResponse["choices"]}");
        //log("jsonResponse[choices]text ${jsonResponse["usage"]["prompt_tokens"]}");
        chatList = List.generate(
          jsonResponse['choices'].length,
          (index) => ChatModel(
            msg: jsonEncode(jsonResponse['choices'][index]['message']['content']),
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }
}
