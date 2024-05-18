class StoryPreview {
  final String id;
  final String thumbnailStorageKey;
  final String title;
  String thumbnailUrl = '';

  StoryPreview({
    required this.id,
    required this.thumbnailStorageKey,
    required this.title,
  });

  factory StoryPreview.fromJson(Map<String, dynamic> json) {
    return StoryPreview(
      id: json['ID'],
      thumbnailStorageKey: json['thumbnail_storage_key'],
      title: json['title'],
    );
  }
}