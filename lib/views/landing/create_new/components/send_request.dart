import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tale_weaver/views/landing/create_new/components/aws_sign.dart';

Future<String> generateVideo(String description, int words) async {
  // Define the URL of the backend endpoint
  var url = Uri.parse('http://10.0.2.2:8080/generate');

  // Create the request body as a JSON-encoded string
  var requestBody = jsonEncode({
    "input": description,
    "voice_id": "2EiwWnXFnvU5JabPnv8n",
    "user_id": "test_user_id",
    "words_per_story": words
  });

  try {
    // Make the POST request
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: requestBody);

    // Check if the request was successful
    if (response.statusCode == 201) {
      // Parse the response body
      var responseData = jsonDecode(response.body);
      print('Story ID: ${responseData['story_id']}');
      print('Video Key: ${responseData['video_key']}');
      var presignUrl = generatePresignedUrl(responseData['video_region'],
          'tale-weaver', responseData['video_key']);
      print(presignUrl);
      return presignUrl;
    } else {
      // Handle the case when the server did not return a 200 OK response
      print('Failed to generate video. Status code: ${response.statusCode}');
      print('Reason: ${response.body}');
      return "";
    }
  } catch (e) {
    // Handle any errors that occur during the HTTP request
    print('Error making the POST request: $e');
    return "";
  }
}
