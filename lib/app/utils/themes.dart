import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const Color mainColor = Color(0xFF39FF14);
  static const Color backgroundColor = Color(0xFF262930);
  static const Color secondaryColor = Color(0xFFF7CA18);
}

class TextStyles {
  const TextStyles();

  static const TextStyle normalText = TextStyle(
    color: Colors.mainColor,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}
