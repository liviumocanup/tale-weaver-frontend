import 'video_segment.dart';

class Story {
  final String id;
  final String videoStorageKey;
  final String thumbnailStorageKey;
  final List<VideoSegment> videoSegments;
  String title;

  Story({
    required this.id,
    required this.videoStorageKey,
    required this.thumbnailStorageKey,
    required this.videoSegments,
    required this.title,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['story_id'],
      videoStorageKey: json['video_storage_key'],
      thumbnailStorageKey: json['thumbnail_storage_key'],
      videoSegments: (json['video_segments'] as List)
          .map((v) => VideoSegment.fromJson(v))
          .toList(),
      title: json['title'],
    );
  }
}