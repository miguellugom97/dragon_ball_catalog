import 'package:dragon_ball_catallog_flutter/home/domain/repositories/home_repository.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/home_view_model.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/api_client.dart';
import 'package:http/http.dart';

import '../data/repositories/home_repository_impl.dart';
import '../domain/usecases/get_all_characters.dart';

class HomeModule {
  HomeViewModel getHomeViewModelFactory() {
    final client = ApiClient.instance.client;
    final repository = providesHomeRepository(client);
    return HomeViewModel(providesGetAllCharacters(repository));
  }

  HomeRepository providesHomeRepository(Client client) {
    return HomeRepositoryImpl(client);
  }

  GetAllCharacters providesGetAllCharacters(HomeRepository repository) {
    return GetAllCharacters(repository);
  }
}
