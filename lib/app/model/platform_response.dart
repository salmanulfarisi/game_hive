import 'package:game_hive/app/model/game_model/platform/platform.dart';

class PlatformResponse {
  final List<PlatformModel> platforms;
  final String error;

  PlatformResponse(this.platforms, this.error);

  PlatformResponse.fromJson(List json)
      : platforms = json.map((i) => PlatformModel.fromJson(i)).toList(),
        error = "";

  PlatformResponse.withError(String errorValue)
      : platforms = [],
        error = errorValue;
}
