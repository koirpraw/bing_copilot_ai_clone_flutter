import 'package:bing_ai_clone_flutter/api/api_connect.dart';
import "package:get/get.dart";
import 'package:flutter/material.dart';

class ApiController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  TextEditingController promptController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    promptController = TextEditingController();
  }

  List<Message> addMessage(Message message) {
    messages.add(message);
    return messages;
  }

  void sendMessage() async {
    if (promptController.text.isNotEmpty) {
      String prompt = promptController.text;
      Message response = await ApiConnection().getResponse(prompt);
      messages.add(response);
      promptController.clear();
    }
  }
}
