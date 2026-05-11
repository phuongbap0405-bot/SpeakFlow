import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const apiKey = 'AIzaSyBt3uberCsGBa9d6iK7TGgBYW7R6RNkFII';
  const model = 'gemini-2.5-flash';
  const url = 'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey';

  final body = {
    'system_instruction': {
      'parts': [
        {'text': 'You are a helpful tutor.'}
      ],
    },
    'contents': [
      {
        'role': 'user',
        'parts': [
          {'text': 'Hello, how are you?'}
        ],
      }
    ],
    'generationConfig': {
      'responseMimeType': 'application/json',
    },
  };

  try {
    print('Sending request to Gemini...');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
  } catch (e) {
    print('Error: $e');
  }
}
