import 'package:bing_ai_clone_flutter/api/api_connect.dart';
import 'package:bing_ai_clone_flutter/model/chat_model.dart';
import "package:get/get.dart";
import 'package:flutter/material.dart';

class ApiController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  TextEditingController promptController = TextEditingController();
  List<String> promptImages = [
    'https://images.unsplash.com/photo-1598219062199-a940294982e7?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1700595888549-d8d63a6e75f7?q=80&w=2030&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1710270030441-e5e8ba543cb4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1710342251561-3fe929efad23?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9b09e5f5e5a7f8d0e9d2b7d5d1d5b0d8&auto=format&fit=crop&w=1350&q=80',
  ];

  @override
  void onInit() {
    // TODO: implement onInitR
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
