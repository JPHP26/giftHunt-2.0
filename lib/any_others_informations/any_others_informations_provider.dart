// Define a provider to manage the additional information state
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdditionalInfoNotifier extends StateNotifier<String?> {
  AdditionalInfoNotifier() : super(null);

  void update(String? newInfo) {
    state = newInfo;
  }
}

final additionalInfoProvider = StateNotifierProvider<AdditionalInfoNotifier, String?>((ref) {
  return AdditionalInfoNotifier();
});
