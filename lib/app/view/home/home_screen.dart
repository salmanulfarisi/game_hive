import 'package:flutter/material.dart';
import 'package:game_hive/app/bloc/get_platforms.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getPlatformsBloc.getPlatforms();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text('Home Screen'),
      ],
    );
  }
}
