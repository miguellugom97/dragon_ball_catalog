import 'package:flutter/cupertino.dart';

import '../domain/entities/character.dart';
import '../domain/usecases/get_all_characters.dart';

class HomeViewModel extends ChangeNotifier {
  final GetAllCharacters getAllCharacters;
  List<Character> characters = [];
  bool isLoading = false;
  String? errorMessage;

  HomeViewModel(this.getAllCharacters);

  Future<void> fetchCharacters() async {
    isLoading = true;
    notifyListeners();

    final result = await getAllCharacters();

    if (result.characters != null) {
      characters = result.characters!;
      errorMessage = null;
    } else {
      characters = [];
      errorMessage = result.errorMessage;
    }

    isLoading = false;
    notifyListeners();
  }
}
