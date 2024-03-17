import "package:get/get.dart";
import 'package:flutter/material.dart';

class ApiController extends GetxController {
  RxList<String> messages = <String>[].obs;
  late TextEditingController promptController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    promptController = TextEditingController();
  }
}
