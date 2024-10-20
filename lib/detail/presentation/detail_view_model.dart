import 'package:dragon_ball_catallog_flutter/detail/domain/usecases/get_character_by_id.dart';
import 'package:flutter/cupertino.dart';

import '../../home/domain/entities/character.dart';

class DetailViewModel extends ChangeNotifier {
  final GetCharacterById getCharacterById;

  Character? character;
  bool isLoading = false;
  String? errorMessage;

  DetailViewModel(this.getCharacterById);

  Future<void> getCharacter(int id) async {
    isLoading = true;
    notifyListeners();
    final result = await getCharacterById(id);

    if (result.success) {
      character = result.character;
      errorMessage = null;
    } else {
      character = null;
      errorMessage = result.errorMessage;
    }

    isLoading = false;
    notifyListeners();
  }
}