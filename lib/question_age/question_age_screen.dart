import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifthunterbetaversion/mark_hobbies/mark_hobbies_screen.dart';
import 'package:gifthunterbetaversion/question_age/question_age_provider.dart';
import 'package:wheel_slider/wheel_slider.dart';

class QuestionAgeScreen extends ConsumerStatefulWidget {
  const QuestionAgeScreen({super.key});

  @override
  ConsumerState<QuestionAgeScreen> createState() => _QuestionAgeScreenState();
}

class _QuestionAgeScreenState extends ConsumerState<QuestionAgeScreen> {
  final int _totalCount = 100;
  int _nCurrentValue = 20;

  @override
  Widget build(BuildContext context) {
    final ageStateNotifier = ref.read(ageProvider.notifier);

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
                  'How old is the person you\'re buying this gift for? Please select the appropriate age range or specify their exact age.',
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
                child: WheelSlider.number(
                  horizontal: false,
                  verticalListHeight: 300.0,
                  perspective: 0.01,
                  totalCount: _totalCount,
                  initValue: _nCurrentValue,
                  unSelectedNumberStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                    fontFamily: 'SourceSans3',
                  ),
                  selectedNumberStyle: const TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'SourceSans3',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5024a2),
                  ),
                  currentIndex: _nCurrentValue,
                  onValueChanged: (val) {
                    setState(() {
                      _nCurrentValue = val;
                    });
                    ageStateNotifier.update((state) => val);
                  },
                  hapticFeedbackType: HapticFeedbackType.heavyImpact,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 20.0, top: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const MarkHobbiesScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff75bd4b),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.maxFinite,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ])),
          ),
        ),
      ),
    );
  }
}
