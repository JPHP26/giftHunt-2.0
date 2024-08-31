import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/question_career/question_career_provider.dart';

import '../choose_occasion/choose_occasion_screen.dart';

class ChooseCareerScreen extends ConsumerWidget {
  const ChooseCareerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final career = ref.watch(careerProvider);
    final isNotWorking = ref.watch(notWorkingProvider);
    final careerNotifier = ref.read(careerProvider.notifier);
    final notWorkingNotifier = ref.read(notWorkingProvider.notifier);

    return Scaffold(
      body: Container(
        color: Colors.purple,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Career Screen',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isNotWorking,
                    onChanged: (value) {
                      notWorkingNotifier.update((state) => value ?? false);
                      if (value == true) {
                        careerNotifier.update((state) => null);
                      }
                    },
                  ),
                  Text(
                    'I am not working',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              if (!isNotWorking)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: DropdownButtonFormField<String>(
                    value: career,
                    hint: Text('Select your career'),
                    items: [
                      'Information Technology (IT)',
                      'Healthcare',
                      'Finance',
                      'Education',
                      'Marketing',
                      'Engineering',
                      'Sales',
                      'Human Resources (HR)',
                      'Design',
                      'Legal',
                      'Consulting',
                      'Government',
                      'Non-Profit',
                      'Retail',
                      'Real Estate',
                      'Manufacturing',
                      'Construction',
                      'Media and Entertainment',
                      'Research and Development (R&D)',
                      'Supply Chain and Logistics',
                      'Telecommunications',
                      'Customer Service',
                      'Energy and Utilities',
                      'Agriculture',
                      'Travel and Hospitality',
                      'Automotive',
                      'Pharmaceuticals',
                      'Biotechnology',
                      'Architecture',
                      'Culinary Arts',
                      'Fitness and Wellness',
                      'Transportation',
                      'Public Relations (PR)',
                      'Arts and Culture',
                      'Social Services',
                      'E-Commerce',
                      'Event Planning',
                      'Education Technology (EdTech)',
                      'Digital Media',
                      'Environmental Science',
                      'Others',
                      'Not working'
                    ].map((career) {
                      return DropdownMenuItem<String>(
                        value: career,
                        child: Text(career),
                      );
                    }).toList(),
                    onChanged: (value) {
                      careerNotifier.update((state) => value);
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QuestionOccasionScreen(),
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
