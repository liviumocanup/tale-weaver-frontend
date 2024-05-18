import 'package:tale_weaver/features/story/domain/models/story_preview.dart';

import '../models/story.dart';
import '../repositories/story_repository.dart';

class StoryService {
  final StoryRepository repository;

  StoryService(this.repository);

  Future<List<StoryPreview>> getStories(String token) async {
    try {
      return await repository.fetchStories(token);
    } catch (e) {
      rethrow;
    }
  }

  Future<Story> getStoryById(String id, String token) async {
    try {
      return await repository.fetchStoryById(id, token);
    } catch (e) {
      rethrow;
    }
  }
}
