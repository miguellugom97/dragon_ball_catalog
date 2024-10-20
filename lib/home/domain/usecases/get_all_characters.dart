import 'package:dragon_ball_catallog_flutter/home/domain/repositories/home_repository.dart';

import '../entities/character.dart';

class GetAllCharacters {
  final HomeRepository repository;

  GetAllCharacters(this.repository);

  Future<GetAllCharactersResult> call() async {
    final response = await repository.getAllCharacters();
    if (response.success) {
      return GetAllCharactersResult.success(response.data);
    } else {
      return GetAllCharactersResult.failure(response.message);
    }
  }
}

class GetAllCharactersResult {
  final List<Character>? characters;
  final String? errorMessage;

  GetAllCharactersResult({this.characters, this.errorMessage});

  factory GetAllCharactersResult.success(List<Character> characters) {
    return GetAllCharactersResult(characters: characters);
  }

  factory GetAllCharactersResult.failure(String errorMessage) {
    return GetAllCharactersResult(errorMessage: errorMessage);
  }
}