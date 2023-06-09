import 'package:flutter/material.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class LogoContainer extends StatelessWidget {
  final Size size;
  final String url;
  const LogoContainer({super.key, required this.size, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: themes.Colors.transparentBlack,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
