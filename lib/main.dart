import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey =
    'sk-HVj6xFo1ClU5YkySCsM9nrspVN1LnIDJeLgtn_vXSVT3BlbkFJHJ8bkpxPxh-c4l0DJ5WdWrmI4fJfvrYucoQ3p9TJgA';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GiftIdeaGenerator(),
    );
  }
}

class GiftIdeaGenerator extends StatefulWidget {
  @override
  _GiftIdeaGeneratorState createState() => _GiftIdeaGeneratorState();
}

class _GiftIdeaGeneratorState extends State<GiftIdeaGenerator> {
  final TextEditingController _controller = TextEditingController();
  String _giftIdea = '';
  bool _isLoading = false;

  Future<void> generateGiftIdea(String prompt) async {
    setState(() {
      _isLoading = true;
      _giftIdea = '';
    });

    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      "model": "gpt-3.5-turbo", // Poți folosi "gpt-3.5-turbo" dacă nu ai acces la GPT-4
      "messages": [
        {"role": "system", "content": "Ești un asistent care generează idei creative de cadouri."},
        {"role": "user", "content": prompt},
      ],
      "max_tokens": 150,
      "n": 1,
      "stop": null,
      "temperature": 0.7,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final message = data['choices'][0]['message']['content'].trim();
        setState(() {
          _giftIdea = message;
        });
      } else {
        setState(() {
          _giftIdea = 'Eroare: ${response.statusCode} - ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        _giftIdea = 'Eroare de rețea: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Generator de Idei de Cadouri'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Descrie persoana (ex: vârsta, interese)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        final prompt = _controller.text.trim();
                        if (prompt.isNotEmpty) {
                          generateGiftIdea(prompt);
                        }
                      },
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text('Generează Idee de Cadou'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _giftIdea,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
