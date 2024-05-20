import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tale_weaver/constants.dart';
import 'package:tale_weaver/features/generate_story/domain/models/story_creation_dto.dart';
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

    if (response.statusCode == 200) {
      final List<dynamic> storiesJson = json.decode(response.body);
      return storiesJson.map((json) => StoryPreview.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load stories');
    }
  }

  Future<Story> fetchStoryById(String id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/story/$id'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Story.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load story');
    }
  }

  Future<Story> createStory(StoryCreationDto story, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/story/'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: story.toJson(),
    );

    if (response.statusCode == 201) {
      return Story.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to create story');
    }
  }

  Future<void> deleteStory(String id, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/story/$id'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to delete story');
    }
  }

  Future<void> updateStory(String id, String title, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/story/$id'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: json.encode({'title': title}),
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to update story');
    }
  }
}
