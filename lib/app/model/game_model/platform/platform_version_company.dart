import 'package:game_hive/app/model/game_model/company/comapany.dart';

class PlatformVersionCompanyModel {
  final int id;
  final String comment;
  final CompanyModel? company;
  final bool developer;
  final bool manufacturer;

  PlatformVersionCompanyModel(
      this.id, this.comment, this.company, this.developer, this.manufacturer);

  factory PlatformVersionCompanyModel.fromJson(Map<String, dynamic> json) {
    return PlatformVersionCompanyModel(
      json['id'] ?? 0,
      json['comment'] ?? 'No comment',
      json['company'] == null ? null : CompanyModel.fromJson(json['company']),
      json['developer'] ?? false,
      json['manufacturer'] ?? false,
    );
  }
}
