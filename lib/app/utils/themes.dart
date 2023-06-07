import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const Color mainColor = Color(0xFF39FF14);
  static const Color backgroundColor = Color(0xFF262930);
  static const Color secondaryColor = Color(0xFFF7CA18);
  static const Color grey = Color.fromARGB(255, 107, 106, 106);
}

class TextStyles {
  const TextStyles();

  static const TextStyle normalText = TextStyle(
    color: Colors.mainColor,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle searchText = TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}
