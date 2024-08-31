import 'package:flutter/material.dart';
import 'package:gifthunterbetaversion/question_gender/question_gender_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'home screen',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const QuestionGenderScreen()),
                    );
                  },
                  child: Text('start ', style: TextStyle(color: Colors.yellow, fontSize: 24)))
            ],
          ),
        ),
      ),
    );
  }
}
