import 'package:flutter/material.dart';
import 'package:game_hive/app/utils/size.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      width: size.width * 0.9,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 15,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          AppSize.width10,
          Text(
            'Search for games, platforms, etc.',
            style: themes.TextStyles.searchText,
          ),
          Spacer(),
          Icon(
            Icons.search,
            color: themes.Colors.grey,
          ),
          AppSize.width10,
        ],
      ),
    );
  }
}
