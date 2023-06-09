import 'package:flutter/material.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class TitleWidget extends StatelessWidget {
  final Size size;
  final String title;
  const TitleWidget({super.key, required this.size, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: size.height * 0.03,
          width: size.width * 0.01,
          margin: EdgeInsets.only(right: size.width * 0.02),
          decoration: BoxDecoration(
            color: themes.Colors.mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          title,
          style: themes.TextStyles.titleText,
        ),
      ],
    );
  }
}
