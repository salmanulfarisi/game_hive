class PlatformLogoModel {
  final int id;
  final bool animated;
  final int height;
  final int width;
  final String imageId;
  final String url;

  PlatformLogoModel(
      this.id, this.animated, this.height, this.width, this.imageId, this.url);

  PlatformLogoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        animated = json['animated'],
        height = json['height'],
        width = json['width'],
        imageId = json['image_id'],
        url = json['url'];
}
