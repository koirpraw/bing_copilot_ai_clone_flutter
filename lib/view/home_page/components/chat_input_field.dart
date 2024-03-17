import 'package:bing_ai_clone_flutter/constants.dart';
import 'package:bing_ai_clone_flutter/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({
    super.key,
    required TextEditingController promptController,
  });

  final ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: apiController.promptController,
      keyboardType: TextInputType.multiline,
      style: const TextStyle(color: Colors.white),
      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: const Color(0xff303030),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: kThemeColor, width: 1.0),
        ),
        // hintText: 'Ask me anything...',
        // hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.pink.shade100,
              ),
              onPressed: () {
                // Send message
              },
            ),
            IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () {
                // Send message
              },
            ),
          ],
        ),
      ),
    );
  }
}
