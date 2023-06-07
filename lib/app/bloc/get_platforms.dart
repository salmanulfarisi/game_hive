import 'package:game_hive/app/model/platform_response.dart';
import 'package:game_hive/app/service/services.dart';
import 'package:rxdart/rxdart.dart';

class GetPlatformsBloc {
  final AllServices _services = AllServices();
  final BehaviorSubject<PlatformResponse> _subject =
      BehaviorSubject<PlatformResponse>();

  getPlatforms() async {
    PlatformResponse response = await _services.getPlatform();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PlatformResponse> get subject => _subject;
}

final getPlatformsBloc = GetPlatformsBloc();
