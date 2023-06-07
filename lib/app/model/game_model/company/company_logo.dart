class CompanyLogoModel {
  final int id;
  final bool animated;
  final int height;
  final int width;
  final String imageId;
  final String url;

  CompanyLogoModel(
      this.id, this.animated, this.height, this.width, this.imageId, this.url);

  factory CompanyLogoModel.fromJson(Map<String, dynamic> json) {
    return CompanyLogoModel(
      json['id'] ?? 0,
      json['animated'] ?? false,
      json['height'] ?? 0,
      json['width'] ?? 0,
      json['image_id'] ?? 'No image id',
      json['url'] ?? 'No url',
    );
  }
}
