import 'package:dragon_ball_catallog_flutter/detail/data/repositories/detail_repository_impl.dart';
import 'package:dragon_ball_catallog_flutter/detail/domain/usecases/get_character_by_id.dart';
import 'package:dragon_ball_catallog_flutter/detail/presentation/detail_view_model.dart';
import 'package:http/http.dart';

import '../../utils/api/api_client.dart';
import '../domain/repositories/detail_repository.dart';

class DetailModule {
  DetailViewModel getDetailViewModelFactory() {
    final client = ApiClient.instance.client;
    final repository = providesDetailRepository(client);
    return DetailViewModel(providesCharacterById(repository));
  }

  DetailRepository providesDetailRepository(Client client) {
    return DetailRepositoryImpl(client);
  }

  GetCharacterById providesCharacterById(DetailRepository repository) {
    return GetCharacterById(repository);
  }
}
