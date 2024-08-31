import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../question_gender_provider.dart';

class GenderDetailsWidget extends ConsumerWidget {
  const GenderDetailsWidget({super.key, required this.gender});
  final String gender;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(questionGenderProvider);

    return GestureDetector(
      onTap: () {
        ref.read(questionGenderProvider.notifier).state = gender;
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedGender == gender ? const Color(0xffddfdb9) : const Color(0xFFe7e2f8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              gender,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset(
                'assets/${gender.toLowerCase()}.png',
                color: const Color(0xff241346),
              ),
            )
          ],
        ),
      ),
    );
  }
}
