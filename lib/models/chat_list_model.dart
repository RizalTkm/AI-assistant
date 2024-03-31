enum ChatResponseType { user, api }

class ChatLIstMOdel {
  final ChatResponseType type;

  final String responseMessage;

  ChatLIstMOdel({required this.type, required this.responseMessage});
}
