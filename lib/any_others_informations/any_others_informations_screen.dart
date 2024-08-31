import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../choose_occasion/choose_occasion_screen.dart';
import 'any_others_informations_provider.dart';

class AnyOtherInformationYouMightAddScreen extends ConsumerWidget {
  const AnyOtherInformationYouMightAddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalInfo = ref.watch(additionalInfoProvider);
    final additionalInfoNotifier = ref.read(additionalInfoProvider.notifier);

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
                'Any Other Information You Might Add',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter additional information',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  maxLines: 4, // Adjust as needed
                  onChanged: (value) {
                    additionalInfoNotifier.update(value);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const QuestionOccasionScreen(),
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
