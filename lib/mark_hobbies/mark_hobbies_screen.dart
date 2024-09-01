import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/mark_hobbies/selected_hobbies_provider.dart';

import '../question_career/choose_career_screen.dart';
import 'generate_hobbies_idea_provider.dart';

class MarkHobbiesScreen extends ConsumerWidget {
  const MarkHobbiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hobbies = ref.watch(hobbiesProvider);
    final selectedHobbies = ref.watch(selectedHobbiesProvider);

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
                      'What hobbies does the person you\'re buying this gift for enjoy? Please select all that apply to help us find the perfect match.',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'SourceSans3',
                          fontWeight: FontWeight.w800,
                          color: Color(0xff241346)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.maxFinite,
                    child: hobbies.when(
                      data: (data) {
                        return Scrollbar(
                          thickness: 1.5,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: List.generate(
                                  data.length,
                                  (index) {
                                    final hobby = data[index];
                                    final isSelected = selectedHobbies.contains(hobby);

                                    return GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(selectedHobbiesProvider.notifier)
                                            .toggleHobby(hobby);
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xffddfdb9)
                                              : const Color(0xFFe7e2f8),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          hobby,
                                          style: TextStyle(
                                              color: const Color(0xff241346),
                                              fontFamily: 'SourceSans3',
                                              fontWeight:
                                                  isSelected ? FontWeight.w800 : FontWeight.w200,
                                              fontSize: 18),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      error: (er, stack) {
                        return Text('$er');
                      },
                      loading: () {
                        return const Center(
                          child: Center(
                              child: SizedBox(
                                  height: 40, width: 40, child: CircularProgressIndicator())),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0, top: 16),
                    child: InkWell(
                      onTap: selectedHobbies.isNotEmpty
                          ? () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const ChooseCareerScreen()),
                              );
                            }
                          : null,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedHobbies.isNotEmpty
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
                                    color: selectedHobbies.isNotEmpty
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
