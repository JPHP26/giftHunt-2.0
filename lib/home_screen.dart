import 'package:flutter/material.dart';
import 'package:gifthunterbetaversion/question_gender/question_gender_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe7edf7),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          color: const Color(0xff5024a2),
          child: SafeArea(
            top: true,
            bottom: false,
            child: Scaffold(
              body: Container(
                color: const Color(0xffe7edf7),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: const BoxDecoration(
                        color: Color(0xff5024a2),
                      ),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        clipBehavior: Clip.none,
                        children: [
                          const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            child: Text(
                              'Hello there!',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'SourceSans3',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            right: 0,
                            top: 50,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                              child: Text(
                                'Celebrate every occasion with the perfect gift.',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'SourceSans3',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -100,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height * 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const QuestionGenderScreen()),
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
                                  'FIND A GIFT',
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
