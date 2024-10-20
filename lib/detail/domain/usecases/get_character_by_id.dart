import 'package:dragon_ball_catallog_flutter/detail/domain/repositories/detail_repository.dart';
import 'package:dragon_ball_catallog_flutter/home/domain/entities/character.dart';

class GetCharacterById {
  final DetailRepository repository;

  GetCharacterById(this.repository);

  Future<GetCharacterByIdResult> call(int id) async {
    final response = await repository.getCharacterById(id);
    if (response.success) {
      return GetCharacterByIdResult.success(response.data);
    } else {
      return GetCharacterByIdResult.error(response.message);
    }
  }
}

class GetCharacterByIdResult {
  final Character? character;
  final String? errorMessage;
  final bool success;

  GetCharacterByIdResult({this.character, this.errorMessage, required this.success});

  factory GetCharacterByIdResult.success(Character character) {
    return GetCharacterByIdResult(character: character, success: true);
  }

  factory GetCharacterByIdResult.error(String errorMessage) {
    return GetCharacterByIdResult(errorMessage: errorMessage, success: false);
  }
}
