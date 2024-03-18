import 'package:bing_ai_clone_flutter/constants.dart';
import 'package:bing_ai_clone_flutter/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({
    super.key,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: apiController.promptController,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kThemeColor, width: 1.0),
            ),
            filled: true,
            fillColor: Color(0xff303030),
            labelText: 'Enter your prompt',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.pink.shade100,
              ),
              onPressed: () {
                if (apiController.promptController.text.isNotEmpty) {
                  apiController.addMessage(
                      apiController.promptController.text.toString());
                }
              },
            )),
      ),
    );
    // );
  }
}
