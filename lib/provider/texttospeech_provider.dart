import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechProvider with ChangeNotifier {
  FlutterTts _flutterTts = FlutterTts();
  bool _isPlaying = false;
  get isPlaying => _isPlaying;

  TextToSpeechProvider() {
    setLanguage();
    speechSettings();

    _flutterTts.setStartHandler(() {
      _isPlaying = true;
      notifyListeners();
    });

    _flutterTts.setCompletionHandler(() {
      _isPlaying = false;
      notifyListeners();
    });

    _flutterTts.setErrorHandler((err) {
      print("error occured: " + err);
      _isPlaying = false;
    });
  }

  void setLanguage() async {
    await _flutterTts.setLanguage("en-US");
  }

  void speechSettings() async {
    Map<String, String> voice() {
      return {
        'name': "en-us-x-sfg#male_1-local",
      };
    }

    _flutterTts.setVoice(voice());
    _flutterTts.setPitch(1.2);
    _flutterTts.setSpeechRate(0.5);
  }

  Future speak(String text) async {
    if (text != null && text.isNotEmpty) {
      print(text);
      var result = await _flutterTts.speak(text);
      if (result == 1) {
        _isPlaying = true;
        notifyListeners();
      }
    }
  }

  Future stop() async {
    var result = _flutterTts.stop();
    if (result == 1) {
      _isPlaying = false;
      notifyListeners();
    }
  }
}
