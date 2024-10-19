import 'package:dragon_ball_catallog_flutter/utils/api/constants.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/http_client_extensions.dart';
import 'package:http/http.dart' as http;

import 'package:dragon_ball_catallog_flutter/home/domain/entities/character.dart';
import 'package:dragon_ball_catallog_flutter/home/domain/repositories/home_repository.dart';

import '../../../utils/api/api_response.dart';
import '../models/character_model.dart';

class HomeRepositoryImpl implements HomeRepository {

  final http.Client client;

  HomeRepositoryImpl(this.client);

  @override
  Future<ApiResponse<List<Character>>> getAllCharacters() async {
    return client.getApiResponse(
      Uri.parse(baseURL),
          (data) => CharactersModel.fromJson(data).toEntity(),
    );
  }
}