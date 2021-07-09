import 'package:flutter/cupertino.dart';
import 'package:simple_speech_recog/screens/home/navigation.dart';

class BottomNavProvider with ChangeNotifier {
  Navigations currentNav = Navigations.synthesizer;

  void goToNav({required Navigations navigation}) {
    currentNav = navigation;
    notifyListeners();
  }
}
