import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/mark_hobbies/mark_hobbies_screen.dart';
import 'package:gifthunterbetaversion/question_age/question_age_provider.dart';

class QuestionAgeScreen extends ConsumerWidget {
  const QuestionAgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ageState = ref.watch(ageProvider);
    final ageStateNotifier = ref.read(ageProvider.notifier);

    return Scaffold(
      body: Container(
        color: Colors.green,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Question Age Screen',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: ageState != null && int.tryParse(ageState) != null,
                    onChanged: (value) {
                      ageStateNotifier.update((state) => value == true ? 'exact' : null);
                    },
                  ),
                  Text(
                    'I know my exact age',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              if (ageState == 'exact')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your age',
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      ageStateNotifier.update((state) => value);
                    },
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: DropdownButtonFormField<String>(
                    value: ageState == null || ageState == 'exact' ? null : ageState,
                    hint: Text('Select age range'),
                    items: [
                      'Under 20',
                      '20-29',
                      '30-39',
                      '40-49',
                      '50 and above',
                    ].map((age) {
                      return DropdownMenuItem<String>(
                        value: age,
                        child: Text(age),
                      );
                    }).toList(),
                    onChanged: (value) {
                      ageStateNotifier.update((state) => value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              TextButton(
                onPressed: () {
                  // Navigate to the next screen using the selected age value
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MarkHobbiesScreen(),
                    ),
                  );
                },
                child: Text('Continue', style: TextStyle(color: Colors.yellow, fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
