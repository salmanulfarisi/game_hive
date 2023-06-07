class PlatformWebsitesModel {
  final int id;
  final int category;
  final bool trusted;
  final String url;

  PlatformWebsitesModel(this.id, this.category, this.trusted, this.url);

  factory PlatformWebsitesModel.fromJson(Map<String, dynamic> json) {
    return PlatformWebsitesModel(
      json['id'] ?? 0,
      json['category'] ?? 0,
      json['trusted'] ?? false,
      json['url'] ?? 'No url',
    );
  }
}
