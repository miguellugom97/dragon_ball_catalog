import 'package:dragon_ball_catallog_flutter/home/domain/repositories/home_repository.dart';
import 'package:dragon_ball_catallog_flutter/home/presentation/home_view_model.dart';
import 'package:dragon_ball_catallog_flutter/utils/api/ApiClient.dart';
import 'package:http/http.dart';

import '../data/repositories/home_repository_impl.dart';
import '../domain/usecases/get_all_characters.dart';

class HomeModule {
  HomeViewModel getHomeViewModelFactory() {
    return HomeViewModel(
        getGetAllCharacters(getHomeRepository(ApiClient.instance.client)));
  }

  HomeRepository getHomeRepository(Client client) {
    return HomeRepositoryImpl(client);
  }

  GetAllCharacters getGetAllCharacters(HomeRepository repository) {
    return GetAllCharacters(repository);
  }
}