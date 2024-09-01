import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/question_gender/question_gender_provider.dart';
import 'package:http/http.dart' as http;

const apiKey =
    'sk-JOk2WpFxUz_fgad9YXtALi6_BOs9RqV5opK0YrItymT3BlbkFJSutfIbEjoDZJYarWZb7IyR1CrwEDZm_YsAZ7pKGw8A';

final hobbiesProvider = FutureProvider<List<String>>((ref) async {
  final gender = ref.watch(questionGenderProvider);
  final url = Uri.parse('https://api.openai.com/v1/chat/completions');

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  final String firstPart =
      gender != null ? 'pentru o persoana de tip ${gender!}' : 'pentru o persoana oarecare';
  const String secondPart =
      'Generate a list of hobbies. Return only the names of the hobbies, separated by commas. Do not include numbers, spaces, or any additional information. return only 32 hobbies. the names should be in english. DO NOT REPEAT THEM';
  final body = jsonEncode({
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        "role": "system",
        "content": "Ești un asistent care generează idei de hobbiuri sub forma de lista."
      },
      {"role": "user", "content": '$firstPart $secondPart'},
    ],
    "max_tokens": 500,
    "n": 1,
    "stop": null,
    "temperature": 0.7,
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final message = data['choices'][0]['message']['content'].trim();

    // final removeNonAlpha = RegExp(r'[^a-zA-Z\s]');
    // String cleanedText = message.replaceAll(removeNonAlpha, '');
    // final multipleSpaces = RegExp(r'\s+');
    // cleanedText.replaceAll(multipleSpaces, ' ').trim();

    List<String> hobbies = message.split(',');
    return hobbies;
  } else {
    throw Exception('Eroare: ${response.statusCode} - ${response.body}');
  }
});
