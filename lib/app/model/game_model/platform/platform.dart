import 'package:game_hive/app/model/game_model/platform/platform_family.dart';
import 'package:game_hive/app/model/game_model/platform/platform_logo.dart';
import 'package:game_hive/app/model/game_model/platform/platform_websites.dart';

class PlatformModel {
  final int id;
  final int category;
  final String abbreviation;
  final String alternativeName;
  final int createdAt;
  final int generation;
  final String name;
  final PlatformFamilyModel? platformFamily;
  final PlatformLogoModel? platformLogo;
  final String slug;
  final String summary;
  final int updatedAt;
  final String url;
  // final List<PlatformVersionModel> versions;
  final List<PlatformWebsitesModel> websites;

  PlatformModel(
      this.id,
      this.category,
      this.abbreviation,
      this.alternativeName,
      this.createdAt,
      this.generation,
      this.name,
      this.platformFamily,
      this.platformLogo,
      this.slug,
      this.summary,
      this.updatedAt,
      this.url,
      // this.versions,
      this.websites);

  factory PlatformModel.fromJson(Map<String, dynamic> json) {
    return PlatformModel(
      json['id'] ?? 0,
      json['category'] ?? 0,
      json['abbreviation'] ?? 'No abbreviation',
      json['alternative_name'] ?? 'No alternative name',
      json['created_at'] ?? 0,
      json['generation'] ?? 0,
      json['name'] ?? 'No name',
      json['platform_family'] == null
          ? null
          : PlatformFamilyModel.fromJson(json['platform_family']),
      json['platform_logo'] == null
          ? null
          : PlatformLogoModel.fromJson(json['platform_logo']),
      json['slug'] ?? 'No slug',
      json['summary'] ?? 'No summary',
      json['updated_at'] ?? 0,
      json['url'] ?? 'No url',
      // json['versions'] == null
      //     ? []
      //     : List<PlatformVersionModel>.from(
      //         json['versions'].map((x) => PlatformVersionModel.fromJson(x))),
      json['websites'] == null
          ? []
          : List<PlatformWebsitesModel>.from(
              json['websites'].map((x) => PlatformWebsitesModel.fromJson(x))),
    );
  }
}
