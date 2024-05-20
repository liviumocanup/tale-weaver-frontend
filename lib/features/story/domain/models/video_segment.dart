class VideoSegment {
  final String id;
  final String text;
  final int duration;
  final int ordinal;

  VideoSegment({
    required this.id,
    required this.text,
    required this.duration,
    required this.ordinal,
  });

  factory VideoSegment.fromJson(Map<String, dynamic> json) {
    return VideoSegment(
      id: json['id'],
      text: json['text'],
      duration: json['duration'],
      ordinal: json['ordinal'],
    );
  }
}