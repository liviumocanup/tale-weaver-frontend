import 'dart:convert';
import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/story/domain/models/story_preview.dart';
import '../models/story.dart';

class StoryRepository {
  final String baseUrl;

  StoryRepository({this.baseUrl = localhostString});

  Future<List<StoryPreview>> fetchStories(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/story'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    safePrint(response.statusCode);
    safePrint(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> storiesJson = json.decode(response.body);
      return storiesJson.map((json) => StoryPreview.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  }

  Future<Story> fetchStoryById(String id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/story/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return Story.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load story');
    }
  }
}
