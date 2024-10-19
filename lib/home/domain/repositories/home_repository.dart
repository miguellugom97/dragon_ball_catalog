import '../../../utils/api/api_response.dart';
import '../entities/character.dart';

abstract class HomeRepository {

  /// Obtiene todos los personajes de Dragon Ball.
  Future<ApiResponse<List<Character>>> getAllCharacters();
}