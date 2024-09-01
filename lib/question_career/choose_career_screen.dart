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

    return Container(
      color: const Color(0xffe7edf7),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color(0xffe7edf7),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Which field or industry does the person you\'re buying this gift for work in? Please choose the option that best describes their profession to help us tailor the perfect gift.',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'SourceSans3',
                        fontWeight: FontWeight.w800,
                        color: Color(0xff241346)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color(0xff5024a2),
                            value: isNotWorking,
                            onChanged: (value) {
                              notWorkingNotifier.update((state) => value ?? false);
                              if (value == true) {
                                careerNotifier.update((state) => null);
                              }
                            },
                          ),
                          const Text(
                            'Not currently employed',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'SourceSans3',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (!isNotWorking)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff241346), width: 0.8),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              dropdownColor: const Color(0xFFe7e2f8),
                              value: career,
                              hint: const Text(
                                'Select your career',
                                style: TextStyle(
                                  color: Color(0xff241346),
                                  fontSize: 18,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              ].map((career) {
                                return DropdownMenuItem<String>(
                                  value: career,
                                  child: Text(
                                    career,
                                    style: const TextStyle(
                                      color: Color(0xff241346),
                                      fontSize: 18,
                                      fontFamily: 'SourceSans3',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                careerNotifier.update((state) => value);
                              },
                              isExpanded: true,
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0, top: 16),
                        child: InkWell(
                          onTap: (career != null || isNotWorking != false)
                              ? () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const QuestionOccasionScreen()),
                                  );
                                }
                              : null,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: (career != null || isNotWorking != false)
                                    ? const Color(0xff75bd4b)
                                    : const Color(0xFFDEDEDE),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Center(
                                  child: Text(
                                    'CONTINUE',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'SourceSans3',
                                        fontWeight: FontWeight.bold,
                                        color: (career != null || isNotWorking != false)
                                            ? Colors.white
                                            : const Color(0xFF727272)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
