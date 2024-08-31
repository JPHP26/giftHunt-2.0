import 'package:flutter/material.dart';

import 'generator_gift_idea_screen.dart';

class ChooseCareerScreen extends StatelessWidget {
  const ChooseCareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose career screen',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => GiftIdeaGenerator()),
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
