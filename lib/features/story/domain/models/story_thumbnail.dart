class StoryThumbnail {
  final String thumbnailStorageKey;

  StoryThumbnail({required this.thumbnailStorageKey});

  factory StoryThumbnail.fromJson(Map<String, dynamic> json) {
    return StoryThumbnail(
      thumbnailStorageKey: json['thumbnail_storage_key'],
    );
  }
}
