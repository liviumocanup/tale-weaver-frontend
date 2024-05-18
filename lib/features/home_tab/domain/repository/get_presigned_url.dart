import 'package:amplify_flutter/amplify_flutter.dart';

Future<void> getDownloadUrl() async {
  try {
    final result = await Amplify.Storage.getUrl(
      path: const StoragePath.fromString('public/example.txt'),
    ).result;
    safePrint('url: ${result.url}');
  } on StorageException catch (e) {
    safePrint(e.message);
  }
}