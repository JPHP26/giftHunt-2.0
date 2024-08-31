import 'package:flutter_riverpod/flutter_riverpod.dart';

class OccasionNotifier extends StateNotifier<String?> {
  OccasionNotifier() : super(null);

  void update(String? newOccasion) {
    state = newOccasion;
  }
}

final occasionProvider = StateNotifierProvider<OccasionNotifier, String?>((ref) {
  return OccasionNotifier();
});
