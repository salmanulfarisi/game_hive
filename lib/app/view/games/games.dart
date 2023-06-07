import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_hive/app/common/alert_dialouge.dart';
import 'package:game_hive/app/utils/size.dart';
import 'package:game_hive/app/view/games/pages/platforms.dart';
import 'package:game_hive/app/view/games/widgets/icon_container.dart';
import 'package:game_hive/app/view/games/widgets/search_bar.dart';
import 'package:line_icons/line_icons.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            const SearchBarWidget(),
            AppSize.height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => AleartDialogueWidget(
                        title: 'Coming Soon',
                        content: 'Top Charts will be available soon',
                        onOkPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  child: const IconContainer(
                      icon: EvaIcons.barChart, text: 'Top Charts'),
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => AleartDialogueWidget(
                        title: 'Coming Soon',
                        content: 'New Releases will be available soon',
                        onOkPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  child: const IconContainer(
                      icon: EvaIcons.calendar, text: 'Upcoming'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlatFormScreen()));
                  },
                  child: const IconContainer(
                      icon: LineIcons.android, text: 'Platform'),
                ),
              ],
            ),
            AppSize.height10,
          ],
        ),
      ),
    );
  }
}
