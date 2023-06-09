import 'package:flutter/material.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class VersionContainer extends StatelessWidget {
  final String image;
  final String name;
  const VersionContainer({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: themes.TextStyles.normalWhiteText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
