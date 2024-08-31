import 'package:flutter/material.dart';

import 'mark_hobbies_screen.dart';

class QuestionGenderScreen extends StatelessWidget {
  const QuestionGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Question gender screen',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MarkHobbiesScreen()),
                    );
                  },
                  child: Text('contoinue ', style: TextStyle(color: Colors.yellow, fontSize: 24)))
            ],
          ),
        ),
      ),
    );
  }
}
