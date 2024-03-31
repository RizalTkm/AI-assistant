import 'package:chat_gpt_application/constants/api_helpers.dart';
import 'package:chat_gpt_application/models/aiModels_response_model.dart';
import 'package:chat_gpt_application/models/chat_response_model.dart';

import 'package:dio/dio.dart';

class ApiServices {
  final _dio = Dio(BaseOptions(
      baseUrl: ApiHelpers.baseUrl, headers: {"Authorization": "Bearer ${ApiHelpers.baseUrl}"}));

  Future<List> getAiModels() async {
    print("function called");
    try {
      final response = await _dio.get("/models");

      final resultList =
          AimodelsResponseModel.fromJson(response.data).data?.toList();

      var list = [];

      for (var i in resultList!) {
        list.add(i.id);
      }

      //  print(list);

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<AimodelsResponseModel> getAiModelsNew() async {
    print("function called");
    try {
      final response = await _dio.get("/models");

      if (response.statusCode == 200) {
        print(response.data);

        return AimodelsResponseModel.fromJson(response.data);
      } else {
        print("look here${response.statusCode}");

        return AimodelsResponseModel();
      }
    } catch (e) {
      print(e);

      return AimodelsResponseModel();
    }
  }

  Future<ChatResponseModel> getChatresponse(
      String modelName, String query) async {
    try {
      final response = await _dio.post('/chat/completions', data: {
        "model": modelName,
        "messages": [
          {"role": "user", "content": query}
        ],
        "temperature": 0.7
      });

      if (response.statusCode == 200) {
        return ChatResponseModel.fromJson(response.data);
      } else {
        return ChatResponseModel();
      }
    } catch (e) {
      print(e);
      return ChatResponseModel();
    }
  }
}
