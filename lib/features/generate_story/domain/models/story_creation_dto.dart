import 'dart:convert';

class StoryCreationDto {
  final String input;
  final String voiceId;
  final int wordsPerStory;

  StoryCreationDto({
    required this.input,
    required this.voiceId,
    required this.wordsPerStory,
  });

  String toJson() {
    return jsonEncode({
      'input': input,
      'voice_id': voiceId,
      'words_per_story': wordsPerStory,
    });
  }
}