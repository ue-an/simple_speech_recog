import 'package:flutter/cupertino.dart';
import 'package:simple_speech_recog/screens/home/home_screen.dart';
import 'package:simple_speech_recog/screens/recognizer/SpeechToText_screen.dart';
import 'package:simple_speech_recog/screens/synthesizer/TextToSpeech_screen.dart';

class Routes {
  Routes._();

  static const String homeScreen = "/homeScreen";
  static const String ttsScreen = "/ttsScreen";
  static const String sttScreen = "/sttScreen";

  static final routes = <String, WidgetBuilder>{
    homeScreen: (BuildContext context) => HomeScreen(),
    ttsScreen: (BuildContext context) => TextToSpeechScreen(),
    sttScreen: (BuildContext context) => SpeechToTextScreen(),
  };
}
