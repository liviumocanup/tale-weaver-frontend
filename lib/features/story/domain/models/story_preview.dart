import 'package:timeago/timeago.dart' as timeago;

class StoryPreview {
  final String id;
  final String thumbnailStorageKey;
  final String title;
  final DateTime createdAt;
  String thumbnailUrl = '';

  StoryPreview({
    required this.id,
    required this.thumbnailStorageKey,
    required this.title,
    required this.createdAt,
  });

  factory StoryPreview.fromJson(Map<String, dynamic> json) {
    return StoryPreview(
      id: json['ID'],
      thumbnailStorageKey: json['thumbnail_storage_key'],
      title: json['title'],
      createdAt: _parseCustomDateTime(json['created_at']),
    );
  }

  static DateTime _parseCustomDateTime(String dateString) {
    // The format is always "yyyy-MM-dd HH:mm:ss.SSSSSS ZZZZ ZZZ"
    String datePart = dateString.split(' ').sublist(0, 2).join(' ');
    return DateTime.parse(datePart);
  }


  String get timeAgo => timeago.format(createdAt);
}