import 'package:game_hive/app/model/game_model/platform/platform.dart';

class GameModel {
  final int id;
  final String name;
  final PlatformModel platforms;
  final double rating;

  GameModel(this.id, this.name, this.platforms, this.rating);

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      json['id'] ?? 0,
      json['name'] ?? 'No name',
      PlatformModel.fromJson(json['platforms']),
      json['rating'] ?? 0.0,
    );
  }
}
