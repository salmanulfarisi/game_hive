class CompanyWebsitesModel {
  final int id;
  final int category;
  final bool trusted;
  final String url;

  CompanyWebsitesModel(this.id, this.category, this.trusted, this.url);

  factory CompanyWebsitesModel.fromJson(Map<String, dynamic> json) {
    return CompanyWebsitesModel(
      json['id'] ?? 0,
      json['category'] ?? 0,
      json['trusted'] ?? false,
      json['url'] ?? 'No url',
    );
  }
}
