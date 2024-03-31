import 'dart:developer';

import 'package:chat_gpt_application/models/chat_list_model.dart';
import 'package:chat_gpt_application/models/chat_response_model.dart';
import 'package:chat_gpt_application/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class ApiserviceProviders extends ChangeNotifier {
  final _chatResponse = <ChatLIstMOdel>[];
  final _modelList = [];

  bool _isSubmitted = false;

  set setissubmitted(bool issubmitted) {
    _isSubmitted = issubmitted;
    notifyListeners();
  }

  ScrollController listScrollController = ScrollController();

  bool get isSubmitted => _isSubmitted;
  String _getdropdownValue = "gpt-3.5-turbo-0301";
  var textEditingController = TextEditingController();
  String get getdropDownValue => _getdropdownValue;
  set setDropDownValue(String dropdownvaluenew) {
    _getdropdownValue = dropdownvaluenew;
    notifyListeners();
  }

  List get modelList => _modelList;
  List<ChatLIstMOdel> get chatResponse => _chatResponse;

  Future fetchAiModels() async {
    final result = await ApiServices().getAiModelsNew();

    // print(result);

    for (var i in result.data!.toList()) {
      _modelList.add(i.id);
    }
    notifyListeners();

    print(_modelList);
    return _modelList;
  }

  scrollToExtent() {
    //  listScrollController.animateTo(listScrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.ease);

    if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.jumpTo(position);
    }

    notifyListeners();
  }

  ClearingChatresponse() {
    Future.delayed(const Duration(seconds: 1), () {
      _chatResponse.clear();

      _isSubmitted = false;

      notifyListeners();
    });
  }

  fetchApiResponse(String modelName, String chatQuery) async {
    print('function called');

    _isSubmitted = true;
    notifyListeners();

    var listNew = <Choices>[];

    try {
      final result = await ApiServices().getChatresponse(modelName, chatQuery);
      listNew = result.choices!.toList();

      if (result.choices != null) {
        for (var i in listNew) {
          if (_chatResponse.length > 1) {}
          _chatResponse.add(ChatLIstMOdel(
              type: ChatResponseType.api,
              responseMessage: i.message!.content.toString()));

          // print(_chatResponse);
          log(_chatResponse.toString());

          scrollToExtent();
          _isSubmitted = false;
          notifyListeners();
        }
      } else {
        _chatResponse.add(ChatLIstMOdel(
            type: ChatResponseType.api,
            responseMessage:
                "The Selected model is not available. We recommend 'gpt-3.5-turbo-0301' for best result"));
      }
    } catch (e) {
      _chatResponse.add(ChatLIstMOdel(
          type: ChatResponseType.api,
          responseMessage:
              "The selected model is not available. We recommend 'gpt-3.5-turbo-0301' for best result"));

      scrollToExtent();
      _isSubmitted = false;
      notifyListeners();
    }
  }
}
