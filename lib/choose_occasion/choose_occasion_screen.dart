import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../any_others_informations/any_others_informations_screen.dart';
import 'occasion_provider.dart'; // Import the provider

class QuestionOccasionScreen extends ConsumerWidget {
  const QuestionOccasionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final occasionState = ref.watch(occasionProvider);
    final occasionStateNotifier = ref.read(occasionProvider.notifier);

    final occasions = [
      'New Year',
      'Christmas',
      'March 1st',
      'March 8th',
      'Dragobete',
      'Valentine\'s Day',
      'Name Day',
      'Birthday',
      'Children\'s Day',
      'Halloween',
    ];

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
                'Select an Occasion',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: occasions.length,
                  itemBuilder: (context, index) {
                    final occasion = occasions[index];
                    final isSelected = occasionState == occasion;

                    return GestureDetector(
                      onTap: () {
                        occasionStateNotifier.update(occasion);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.yellow : Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          occasion,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AnyOtherInformationYouMightAddScreen(),
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
