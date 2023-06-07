import 'package:flutter/material.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class IconContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconContainer({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.25,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: themes.Colors.transparentBlack,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: themes.Colors.mainColor),
          Text(text, style: themes.TextStyles.iconContainerText),
        ],
      ),
    );
  }
}
