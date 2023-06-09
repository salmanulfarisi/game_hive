import 'package:flutter/material.dart';

PopupMenuItem buildPopupMenuItem(
  String title,
  IconData iconData,
  Function() onTap,
) {
  return PopupMenuItem(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
        Text(title),
      ],
    ),
  );
}
