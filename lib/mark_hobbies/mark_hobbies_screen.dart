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

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Text(
              'Mark hobbies screen',
              style: TextStyle(color: Colors.blueGrey, fontSize: 24),
            ),
            hobbies.when(
              data: (data) {
                return Expanded(
                  child: SizedBox(
                    height: 300,
                    child: GridView.count(
                      childAspectRatio: 3,
                      padding: const EdgeInsets.all(3),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                      children: List.generate(
                        32,
                        (index) {
                          final hobby = data[index];
                          final isSelected = selectedHobbies.contains(hobby);

                          return GestureDetector(
                            onTap: () {
                              ref.read(selectedHobbiesProvider.notifier).toggleHobby(hobby);
                            },
                            child: Container(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.yellow, // Highlight selected hobby
                              alignment: Alignment.center,
                              child: Text(
                                hobby,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              error: (er, stack) {
                return Text('Error loading hobbies');
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const ChooseCareerScreen()),
                );
              },
              child: Text('Continue', style: TextStyle(color: Colors.yellow, fontSize: 24)),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
