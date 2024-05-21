import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tale_weaver/features/story/domain/models/story_preview.dart';
import 'package:tale_weaver/utils/logger.dart';

class S3Util {
  static Future<Uri> fetchResourceUrl(String key) async {
    try {
      final getUrlResult =
          Amplify.Storage.getUrl(path: StoragePath.fromString(key))
              .result
              .then((value) => value.url);

      return getUrlResult;
    } on StorageException catch (e) {
      throw Exception('Error fetching URL: ${e.message}');
    }
  }

  static Future<void> fetchThumbnailUrls(
      List<StoryPreview> storyPreviews) async {
    try {
      var thumbnailUrlFutures = storyPreviews
          .map((story) =>
              S3Util.fetchResourceUrl(story.thumbnailStorageKey).then((url) {
                story.thumbnailUrl = url.toString();
              }))
          .toList();

      await Future.wait(thumbnailUrlFutures);
    } catch (e) {
      AppLogger.error('Error fetching thumbnail URLs: $e');
    }
  }
}
