import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedHobbiesProvider = StateNotifierProvider<SelectedHobbiesNotifier, Set<String>>(
  (ref) => SelectedHobbiesNotifier(),
);

class SelectedHobbiesNotifier extends StateNotifier<Set<String>> {
  SelectedHobbiesNotifier() : super({});

  void toggleHobby(String hobby) {
    state = {...state};
    if (state.contains(hobby)) {
      state.remove(hobby);
    } else {
      state.add(hobby);
    }
  }
}
