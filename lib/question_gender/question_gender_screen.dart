import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/question_age/question_age_screen.dart';
import 'package:gifthunterbetaversion/question_gender/question_gender_provider.dart';

class QuestionGenderScreen extends ConsumerWidget {
  const QuestionGenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(questionGenderProvider);

    return Scaffold(
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Question gender screen',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              // Radio button for Female
              RadioListTile<String>(
                title: const Text('Female', style: TextStyle(color: Colors.white)),
                value: 'female',
                groupValue: selectedGender,
                onChanged: (value) {
                  ref.read(questionGenderProvider.notifier).state = value;
                },
              ),
              // Radio button for Male
              RadioListTile<String>(
                title: const Text('Male', style: TextStyle(color: Colors.white)),
                value: 'male',
                groupValue: selectedGender,
                onChanged: (value) {
                  ref.read(questionGenderProvider.notifier).state = value;
                },
              ),
              // Radio button for Others
              RadioListTile<String>(
                title: const Text('Others', style: TextStyle(color: Colors.white)),
                value: 'others',
                groupValue: selectedGender,
                onChanged: (value) {
                  ref.read(questionGenderProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: selectedGender != null
                    ? () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const QuestionAgeScreen()),
                        );
                      }
                    : null, // Disable the button if no option is selected
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.yellow, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
