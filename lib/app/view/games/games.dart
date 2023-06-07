import 'package:flutter/cupertino.dart';
import 'package:game_hive/app/view/home/widgets/platformContainer.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.1,
          child: const PlatformContainer(),
        ),
      ],
    );
  }
}
