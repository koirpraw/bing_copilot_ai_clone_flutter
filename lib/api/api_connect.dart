import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConnection extends GetConnect {
  var url = "https://api.openai.com/v1/chat/completions";
  List<String> messages = [];

  @override
  void onInit() {}

  // Future<Response> getResponse() async {
  //   var response = await post(
  //     url,
  //     {
  //       "model": "gpt-3.5-turbo",
  //       "messages": [
  //         {"role": "system", "content": "You are a helpful assistant."},
  //         {"role": "user", "content": "What is the meaning of life?"},
  //       ],
  //     },
  //     headers: {
  //       "Authorization": "Bearer ${dotenv.env['OPENAI_API_KEY']}",
  //       "Content-Type": "application/json",
  //     },
  //   );
  //   print(response.body);
  //   return response;
  // }

  Future<String> getResponse(String prompt) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${dotenv.env['OPENAI_API_KEY']}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            // {"role": "user", "content": "What is an api?"},
            {"role": "user", "content": prompt},
          ],
        }),
      );
      var data = jsonDecode(response.body);
      String message = data['choices'][0]['message']['content'];

      print(message);
      return message;
    } catch (e) {
      print('Request failed with error: $e');
      rethrow;
    }
  }
}
