import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<Color?> keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              for (int i = 0; i < keyColors.length; i++)
                XyloPhoneButton(
                    note: 'note${i + 1}.wav', keyColor: keyColors[i]),
            ],
          ),
        ),
      ),
    );
  }
}

class XyloPhoneButton extends StatelessWidget {
  final String note;
  final Color? keyColor;

  void playSound(String note) {
    final player = AudioPlayer();
    player.play(
      AssetSource(note),
    );
  }

  const XyloPhoneButton(
      {super.key, required this.note, required this.keyColor});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: TextButton.styleFrom(backgroundColor: keyColor),
        onPressed: () {
          playSound(note);
        },
        child: const SizedBox(),
      ),
    );
  }
}
