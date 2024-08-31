import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/question_age/question_age_screen.dart';
import 'package:gifthunterbetaversion/question_gender/question_gender_provider.dart';

import 'widgets/gender_details_widget.dart';

class QuestionGenderScreen extends ConsumerWidget {
  const QuestionGenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(questionGenderProvider);

    return Container(
      color: const Color(0xffe7edf7),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color(0xffe7edf7),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Who are you buying this gift for: a man, a woman, or would you rather not say?',
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
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GenderDetailsWidget(
                          gender: 'Woman',
                        ),
                        GenderDetailsWidget(
                          gender: 'Man',
                        ),
                        GenderDetailsWidget(
                          gender: 'Other',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0, top: 16),
                    child: InkWell(
                      onTap: selectedGender != null
                          ? () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const QuestionAgeScreen()),
                              );
                            }
                          : null,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGender != null
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
                                    color: selectedGender != null
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
          ),
        ),
      ),
    );
  }
}
