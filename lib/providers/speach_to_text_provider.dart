import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextProvider extends ChangeNotifier {


  speachToTextconverter() async {
    
    stt.SpeechToText speech = stt.SpeechToText();

    bool available = await speech.initialize(onStatus: (status) {
      print(status);
    }, onError: (error) {
      print(error.errorMsg);
    });

    if (available) {
      speech.listen(onResult: (result) {
        print(result);
      });
    } else {
      print('user has denied');
    }
  }
}
