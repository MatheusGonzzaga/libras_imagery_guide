import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color get offWhite => const Color(0xFFF9F9F9);
  static Color get darkBlue => const Color(0xFF13293D);
  static Color get blue => const Color(0xFF3685FF);
  static Color get lightBlue => const Color(0xFFDCEAFF);
  static Color get yellow => const Color(0xFFFFB521);

  static Color get white => Colors.white;
  static Color get error => Colors.red;
  static Color get black => Colors.black;

  static final blueToDark = [
    darkBlue.withOpacity(0.5),
    darkBlue.withOpacity(0.7),
    darkBlue,
    black
  ];

  static final blueToWhite = [
    const Color(0xFF3685FF),
    const Color(0xFF5DA5FF),
    const Color(0xFF89C8FF),
    const Color(0xFFDCEAFF),
  ];

  static final gradients = [
    darkBlueToBlue,
    darkBlueToRed,
    darkBlueToGreen,
    darkBlueToYellow,
    darkBlueToPurple,
    darkBlueToOrange,
  ];

  static final darkBlueToBlue = [
    const Color(0xFF13293D),
    const Color(0xFF1E4D61),
    const Color(0xFF296685),
    const Color(0xFF337FA9),
    const Color(0xFF3685FF),
  ];

  static final darkBlueToRed = [
    const Color(0xFF13293D),
    const Color(0xFF3D1A1A),
    const Color(0xFF662222),
    const Color(0xFF8F2A2A),
    const Color(0xFFB83232),
  ];

  static final darkBlueToGreen = [
    const Color(0xFF13293D),
    const Color(0xFF1A3D1A),
    const Color(0xFF226622),
    const Color(0xFF2A8F2A),
    const Color(0xFF32B832),
  ];

  static final darkBlueToYellow = [
    const Color(0xFF13293D),
    const Color(0xFF3D3D1A),
    const Color(0xFF666622),
    const Color(0xFF8F8F2A),
    const Color(0xFFB8B832),
  ];

  static final darkBlueToPurple = [
    const Color(0xFF13293D),
    const Color(0xFF2A1A3D),
    const Color(0xFF442266),
    const Color(0xFF5D2A8F),
    const Color(0xFF7632B8),
  ];

  static final darkBlueToOrange = [
    const Color(0xFF13293D),
    const Color(0xFF3D2A1A),
    const Color(0xFF664422),
    const Color(0xFF8F5D2A),
    const Color(0xFFB87632),
  ];
}
