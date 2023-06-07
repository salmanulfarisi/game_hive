import 'package:game_hive/app/model/game_model/company/company_logo.dart';
import 'package:game_hive/app/model/game_model/company/company_websites.dart';
import 'package:game_hive/app/model/game_model/game/game.dart';

class CompanyModel {
  final int id;
  final int changeDate;
  final int changeDateCategory;
  final CompanyModel? company;
  final int country;
  final int createdAt;
  final String description;
  final GameModel? developedGames;
  final CompanyLogoModel? logo;
  final String name;
  final CompanyModel? parent;
  final GameModel? publishedGames;
  final String slug;
  final int startDate;
  final int startDateCategory;
  final int updatedAt;
  final String url;
  final List<CompanyWebsitesModel> websites;

  CompanyModel(
    this.id,
    this.changeDate,
    this.changeDateCategory,
    this.company,
    this.country,
    this.createdAt,
    this.description,
    this.developedGames,
    this.logo,
    this.name,
    this.parent,
    this.publishedGames,
    this.slug,
    this.startDate,
    this.startDateCategory,
    this.updatedAt,
    this.url,
    this.websites,
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      json['id'] ?? 0,
      json['change_date'] ?? 0,
      json['change_date_category'] ?? 0,
      CompanyModel.fromJson(json['company']),
      json['country'] ?? 0,
      json['created_at'] ?? 0,
      json['description'] ?? 'No description',
      json['developed_games'] == null
          ? null
          : GameModel.fromJson(json['developed_games']),
      json['logo'] == null ? null : CompanyLogoModel.fromJson(json['logo']),
      json['name'] ?? 'No name',
      json['parent'] == null ? null : CompanyModel.fromJson(json['parent']),
      json['published_games'] == null
          ? null
          : GameModel.fromJson(json['published_games']),
      json['slug'] ?? 'No slug',
      json['start_date'] ?? 0,
      json['start_date_category'] ?? 0,
      json['updated_at'] ?? 0,
      json['url'] ?? 'No url',
      List<CompanyWebsitesModel>.from(
          json['websites'].map((x) => CompanyWebsitesModel.fromJson(x))),
    );
  }
}
