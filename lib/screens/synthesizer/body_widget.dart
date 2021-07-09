import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_speech_recog/provider/texttospeech_provider.dart';

class TTSBodyWidget extends StatelessWidget {
  final TextEditingController textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 21.0, vertical: 18.0),
              child: TextFormField(
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: textCtrl,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: context.watch<TextToSpeechProvider>().isPlaying
            ? // IconButton(
            //     icon: Icon(Icons.stop),
            //     onPressed: () {
            //       //context.read<TextToSpeechProvider>().stop();
            //     },
            //   )
            Icon(Icons.stop)
            : // IconButton(
            //     icon: Icon(Icons.play_arrow),
            //     onPressed: () {
            //       context.read<TextToSpeechProvider>().speak(textCtrl.text);
            //     },
            //   ),
            Icon(Icons.play_arrow),
        onPressed: () {
          if (context.read<TextToSpeechProvider>().isPlaying) {
            context.read<TextToSpeechProvider>().stop();
            textCtrl.text = "";
          } else {
            context.read<TextToSpeechProvider>().speak(textCtrl.text);
          }
        },
      ),
    );
  }
}
