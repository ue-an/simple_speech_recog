import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
// import 'package:simple_speech_recog/provider/botnav_provider.dart';
// import 'package:simple_speech_recog/screens/home/navigation.dart';
import 'package:simple_speech_recog/screens/recognizer/SpeechToText_screen.dart';
import 'package:simple_speech_recog/screens/synthesizer/TextToSpeech_screen.dart';
import 'package:simple_speech_recog/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _screenOptions = <Widget>[
    TextToSpeechScreen(),
    SpeechToTextScreen(),
  ];

  void onBottomTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      // body: Column(
      //   children: [
      //     //ListView(),
      //     Expanded(
      //       child: context.watch<BottomNavProvider>().currentNav ==
      //               Navigations.synthesizer
      //           ? TextToSpeechScreen()
      //           : SpeechToTextScreen(),
      //     ),
      //     Container(
      //       color: Colors.teal,
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Column(
      //               children: [
      //                 IconButton(
      //                   onPressed: () {
      //                     context
      //                         .read<BottomNavProvider>()
      //                         .goToNav(navigation: Navigations.synthesizer);
      //                   },
      //                   icon: Icon(
      //                     Icons.volume_up,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 Text(
      //                   'Text to Speech',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Column(
      //               children: [
      //                 IconButton(
      //                   onPressed: () {
      //                     context
      //                         .read<BottomNavProvider>()
      //                         .goToNav(navigation: Navigations.recognizer);
      //                   },
      //                   icon: Icon(
      //                     Icons.mic,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 Text(
      //                   'Speech to Text',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.white,
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.volume_up),
            label: 'Text to Speech',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Speech to Text',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: onBottomTap,
      ),
    );
  }
}
