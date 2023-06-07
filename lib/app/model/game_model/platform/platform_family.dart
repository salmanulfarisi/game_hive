class PlatformFamilyModel {
  final int id;
  final String name;
  final String slug;

  PlatformFamilyModel(this.id, this.name, this.slug);

  factory PlatformFamilyModel.fromJson(Map<String, dynamic> json) {
    return PlatformFamilyModel(
      json['id'] ?? 0,
      json['name'] ?? 'No name',
      json['slug'] ?? 'No slug',
    );
  }
}
