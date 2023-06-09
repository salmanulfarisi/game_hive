import 'package:flutter/material.dart';
import 'package:game_hive/app/model/game_model/platform/platform_version.dart';
import 'package:game_hive/app/utils/themes.dart' as themes;

class VersionDetails extends StatelessWidget {
  final PlatformVersionModel data;
  const VersionDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.Colors.mainBackground,
      body: Center(
        child: Text(data.name ?? 'No Data'),
      ),
    );
  }
}
