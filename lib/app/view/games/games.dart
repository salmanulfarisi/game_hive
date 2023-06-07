import 'package:flutter/cupertino.dart';
import 'package:game_hive/app/view/games/widgets/search_bar.dart';

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
      child: Column(
        children: <Widget>[
          SearchBarWidget(),
        ],
      ),
    );
  }
}
