import "package:get/get.dart";
import 'package:flutter/material.dart';

class ApiController extends GetxController {
  RxList<String> messages = <String>[].obs;
  TextEditingController promptController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // promptController = TextEditingController();
  }

  List<String> addMessage(String message) {
    messages.add(message);
    return messages;
  }
}
