import 'package:game_hive/app/model/game_model/platform/platform_logo.dart';
import 'package:game_hive/app/model/game_model/platform/platform_version_company.dart';

class PlatformVersionModel {
  final int id;
  final List<PlatformVersionCompanyModel>? companies;
  final String? connectivity;
  final String? cpu;
  final String? graphics;
  final PlatformVersionCompanyModel? mainManufacturer;
  final String? media;
  final String? memory;
  final String? name;
  final String? os;
  final String? output;
  final PlatformLogoModel? platformLogo;
  final String? resolution;
  final String? slug;
  final String? sound;
  final String? storage;
  final String? summary;
  final String? url;

  PlatformVersionModel(
      this.id,
      this.companies,
      this.connectivity,
      this.cpu,
      this.graphics,
      this.mainManufacturer,
      this.media,
      this.memory,
      this.name,
      this.os,
      this.output,
      this.platformLogo,
      this.resolution,
      this.slug,
      this.sound,
      this.storage,
      this.summary,
      this.url);

  factory PlatformVersionModel.fromJson(Map<String, dynamic> json) {
    return PlatformVersionModel(
      json['id'] ?? 0,
      json['companies'] == null
          ? []
          : List<PlatformVersionCompanyModel>.from(json['companies']
              .map((e) => PlatformVersionCompanyModel.fromJson(e))),
      json['connectivity'] ?? 'No connectivity',
      json['cpu'] ?? 'No cpu',
      json['graphics'] ?? 'No graphics',
      json['main_manufacturer'] == null
          ? null
          : PlatformVersionCompanyModel.fromJson(json['main_manufacturer']),
      json['media'] ?? 'No media',
      json['memory'] ?? 'No memory',
      json['name'] ?? 'No name',
      json['os'] ?? 'No os',
      json['output'] ?? 'No output',
      json['platform_logo'] == null
          ? null
          : PlatformLogoModel.fromJson(json['platform_logo']),
      json['resolution'] ?? 'No resolution',
      json['slug'] ?? 'No slug',
      json['sound'] ?? 'No sound',
      json['storage'] ?? 'No storage',
      json['summary'] ?? 'No summary',
      json['url'] ?? 'No url',
    );
  }
}
