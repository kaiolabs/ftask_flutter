import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/repositories/i_repository.dart';
import '../../../core/domain/repositories/i_repository_factory.dart';
import '../../../core/domain/services/i_http_service.dart';
import '../../../core/domain/usecases/i_login_usecase.dart';
import '../../../core/infra/application/api_endpoints.dart';
import '../../../core/infra/application/app_settings.dart';
import '../../../core/infra/application/http_request_methods.dart';
import '../../../core/infra/application/http_timeout_configurations.dart';
import '../../../core/infra/application/logger.dart';
import '../../../core/infra/application/login_request.dart';

class LoginUseCaseImpl implements ILoginUsecase {
  final IHttpService httpService;
  final IRepositoryFactory repositoryFactory;
  final UserEntity user;

  LoginUseCaseImpl({required this.httpService, required this.repositoryFactory, required this.user});

  @override
  Future<UserEntity?> call(LoginRequest loginRequest) async {
    try {
      var authUser = await httpService.request(
          baseUrl: AppSettings.baseApiUrl,
          endPoint: ApiEndpoints.auth,
          method: HttpRequestMethods.post,
          params: loginRequest.toJson(),
          receiveTimeout: HttpTimeoutConfigurations.receiveTimeoutUsecase,
          connectTimeout: HttpTimeoutConfigurations.connectTimeoutUsecase);

      IRepository<UserEntity> repository = await repositoryFactory.get<UserEntity>();
      UserEntity userAuthModel = UserEntity.fromAuth(authUser);
      await repository.put(userAuthModel.id, userAuthModel);
      user.setAuthUser(userAuthModel);
      return userAuthModel;
    } catch (e) {
      fLog.e(e);
      return null;
    }
  }
}
