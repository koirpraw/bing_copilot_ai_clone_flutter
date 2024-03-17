class ChatModel {
  String? model;
  String? prompt;
  String? completion;
  List<MessageModel>? messages;
  int? tokens;
}

class MessageModel {
  String? role;
  String? content;
}
