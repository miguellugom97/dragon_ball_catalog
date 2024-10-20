import 'package:dragon_ball_catallog_flutter/home/domain/entities/character.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/api_response.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/constants.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/http_client_extensions.dart';
import 'package:http/http.dart' as http;

import '../../../home/data/models/character_model.dart';
import '../../domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final http.Client client;

  DetailRepositoryImpl(this.client);

  @override
  Future<ApiResponse<Character>> getCharacterById(int id) {
    return client.getApiResponse(
      Uri.parse('$baseURL/$id'),
      (data) => CharacterModel.fromJson(data).toEntity(),
    );
  }
}
