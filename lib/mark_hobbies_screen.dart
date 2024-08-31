import 'package:flutter/material.dart';

import 'choose_career_screen.dart';

class MarkHobbiesScreen extends StatelessWidget {
  const MarkHobbiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Mark hobbies screen',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const ChooseCareerScreen()),
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
