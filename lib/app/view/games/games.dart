import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_hive/app/utils/size.dart';
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
    final size = MediaQuery.of(context).size;
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            SearchBarWidget(),
            AppSize.height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconContainer(icon: EvaIcons.barChart, text: 'Top Charts'),
                IconContainer(icon: EvaIcons.calendar, text: 'Upcoming'),
                IconContainer(icon: LineIcons.android, text: 'Platform'),
              ],
            ),
            AppSize.height10,
          ],
        ),
      ),
    );
  }
}
