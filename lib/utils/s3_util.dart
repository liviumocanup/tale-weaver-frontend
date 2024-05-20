import 'package:amplify_flutter/amplify_flutter.dart';

class S3Util {
  static Future<Uri> fetchResourceUrl(String key) async {
    try {
      final getUrlResult = Amplify.Storage.getUrl(
        path: StoragePath.fromString(key)
      ).result.then((value) => value.url);

      return getUrlResult;
    } on StorageException catch (e) {
      throw Exception('Error fetching URL: ${e.message}');
    }
  }
}
