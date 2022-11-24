import '../../../core/domain/entities/task_entity.dart';
import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/repositories/i_repository.dart';
import '../../../core/domain/repositories/i_repository_factory.dart';
import '../../../core/domain/services/i_http_service.dart';
import '../../../core/domain/usecases/i_get_by_id_from_cloud_usecase.dart';
import '../../../core/infra/application/api_endpoints.dart';
import '../../../core/infra/application/app_settings.dart';
import '../../../core/infra/application/http_request_methods.dart';
import '../../../core/infra/application/http_timeout_configurations.dart';

class GetByIdFromCloudUsecase implements IGetByIdFromCloudUsecase {
  final IHttpService httpService;
  final IRepositoryFactory repositoryFactory;
  final UserEntity user;

  GetByIdFromCloudUsecase({required this.httpService, required this.repositoryFactory, required this.user});

  @override
  Future<bool> call(String id) async {
    var entity = await httpService.request(
        baseUrl: AppSettings.baseApiUrl,
        endPoint: ApiEndpoints.get,
        method: HttpRequestMethods.get,
        params: {'id': id},
        token: user.token,
        receiveTimeout: HttpTimeoutConfigurations.receiveTimeoutUsecase,
        connectTimeout: HttpTimeoutConfigurations.connectTimeoutUsecase);

    IRepository<TaskEntity> repository = await repositoryFactory.get<TaskEntity>();
    TaskEntity task = TaskEntity.fromCloud(entity);
    await repository.put(task.id, task);
    return true;
  }
}
