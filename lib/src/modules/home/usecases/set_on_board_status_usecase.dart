import '../../../core/domain/entities/task_entity.dart';
import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/repositories/i_repository_factory.dart';
import '../../../core/domain/services/i_http_service.dart';
import '../../../core/domain/usecases/i_set_on_board_status_usecase.dart';
import '../../../core/infra/application/api_endpoints.dart';
import '../../../core/infra/application/app_settings.dart';
import '../../../core/infra/application/http_request_methods.dart';
import '../../../core/infra/application/http_timeout_configurations.dart';

class SetOnBoardStatusUseCase implements ISetOnBoardStatusUsecase {
  final IHttpService httpService;
  final IRepositoryFactory repositoryFactory;
  final UserEntity user;

  SetOnBoardStatusUseCase({required this.repositoryFactory, required this.httpService, required this.user});

  @override
  Future<bool> call(String id, bool onBoard) async {
    var repository = await repositoryFactory.get<TaskEntity>();
    var entity = await repository.get(id);
    if (entity != null) {
      int date = DateTime.now().millisecondsSinceEpoch;
      entity.setPersisted(date);
      entity.setUpdated(date);
      entity.setPending(true);
      await repository.put(id, entity);

      entity.setOnBoard(onBoard);
      var payload = {
        'userId': user.id,
        'value': entity.toCloud(),
      };

      httpService.request(
          baseUrl: AppSettings.baseApiUrl,
          endPoint: ApiEndpoints.upsertOne,
          method: HttpRequestMethods.put,
          params: payload,
          token: user.token,
          receiveTimeout: HttpTimeoutConfigurations.receiveTimeoutUsecase,
          connectTimeout: HttpTimeoutConfigurations.connectTimeoutUsecase);
    }
    return true;
  }
}
