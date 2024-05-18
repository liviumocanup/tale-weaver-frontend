import 'package:tale_weaver/features/story/domain/models/story_preview.dart';

import 's3_util.dart';

Future<void> fetchThumbnailUrls(List<StoryPreview> storyPreviews) async {
  try {
    var thumbnailUrlFutures = storyPreviews
        .map((story) =>
            S3Util.fetchResourceUrl(story.thumbnailStorageKey).then((url) {
              story.thumbnailUrl = url.toString();
            }))
        .toList();

    await Future.wait(thumbnailUrlFutures);
  } catch (e) {
    print('Error fetching thumbnail URLs: $e');
  }
}
