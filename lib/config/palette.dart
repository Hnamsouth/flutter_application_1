import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color.fromARGB(255, 18, 18, 18);

  static const Color youtubeRed = Color.fromARGB(255, 15, 117, 226);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color.fromARGB(255, 45, 98, 212);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
