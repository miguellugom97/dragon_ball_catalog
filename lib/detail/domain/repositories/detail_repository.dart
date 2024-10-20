import 'package:dragon_ball_catallog_flutter/home/domain/entities/character.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/api_response.dart';

abstract class DetailRepository {

  /// Obtiene un personaje de Dragon Ball por su id.
  Future<ApiResponse<Character>> getCharacterById(int id);
}