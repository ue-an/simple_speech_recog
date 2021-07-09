import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_speech_recog/provider/botnav_provider.dart';
import 'package:simple_speech_recog/provider/texttospeech_provider.dart';
import 'package:simple_speech_recog/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => TextToSpeechProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
